#!/bin/bash

set -e

function run_checks() {

  last_attempt=$1
  namespace=calico-system

  MAX_ATTEMPTS=10
  attempt=0
  PODS=()
  while [ $attempt -lt $MAX_ATTEMPTS ]; do
    # Get list of calico-node pods (There will be 1 pod per worker node)
    if while IFS='' read -r line; do PODS+=("$line"); done < <(kubectl get pods -n "${namespace}" | grep calico-node | cut -f1 -d ' '); then
      if [ ${#PODS[@]} -eq 0 ]; then
        echo "No calico-node pods found. Retrying in 10s. (Attempt $((attempt+1)) / $MAX_ATTEMPTS)"
        sleep 10
        ((attempt=attempt+1))
      else
        # Pods found, break out of loop
        break
      fi
    else
      echo "Error getting calico-node pods. Retrying in 10s. (Attempt $((attempt+1)) / $MAX_ATTEMPTS)"
      sleep 10
      ((attempt=attempt+1))
    fi
  done

  if [ ${#PODS[@]} -eq 0 ]; then
    echo "No calico-node pods found after $MAX_ATTEMPTS attempts. Exiting."
    exit 1
  fi

  # Iterate through pods to check health
  healthy=true
  for pod in "${PODS[@]}"; do
    command="kubectl logs ${pod} -n ${namespace} --tail=0"
    # If it is the last attempt then print the output
    if [ "${last_attempt}" == true ]; then
      node=$(kubectl get pod "$pod" -n "${namespace}" -o=jsonpath='{.spec.nodeName}')
      echo "Checking node: $node"
      if ! ${command}; then
        healthy=false
      else
        echo "OK"
      fi
    # Otherwise redirect output to /dev/null
    else
      if ! ${command} &> /dev/null; then
        healthy=false
      fi
    fi
  done

  if [ "$healthy" == "false" ]; then
    return 1
  else
    return 0
  fi

}

counter=0
number_retries=40
retry_wait_time=60

echo "Running script to ensure kube master can communicate with all worker nodes.."

while [ ${counter} -le ${number_retries} ]; do

  # Determine if it is last attempt
  last_attempt=false
  if [ "${counter}" -eq ${number_retries} ]; then
    last_attempt=true
  fi

  ((counter=counter+1))
  if ! run_checks ${last_attempt}; then
    if [ "${counter}" -gt ${number_retries} ]; then
      echo "Maximum attempts reached, giving up."
      echo
      echo "Found kube master is unable to communicate with one or more of its workers."
      echo "Please create a support issue with IBM Cloud and include the error message."
      exit 1
    else
      echo "Retrying in ${retry_wait_time}s. (Retry attempt ${counter} / ${number_retries})"
      sleep ${retry_wait_time}
    fi
  else
    break
  fi
done

echo "Success! Master can communicate with all worker nodes."
