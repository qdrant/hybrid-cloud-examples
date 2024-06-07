#!/bin/bash

set -euo pipefail

REGION="$1"
RESOURCE_GROUP_ID="$2"
APIKEY_KEY_NAME="containers-kubernetes-key"

# Expects the environment variable $IBMCLOUD_API_KEY to be set
if [[ -z "${IBMCLOUD_API_KEY}" ]]; then
    echo "API key must be set with IBMCLOUD_API_KEY environment variable" >&2
    exit 1
fi

if [[ -z "${REGION}" ]]; then
    echo "Region must be passed as first input script argument" >&2
    exit 1
fi

if [[ -z "${RESOURCE_GROUP_ID}" ]]; then
    echo "Resource_group_id must be passed as second input script argument" >&2
    exit 1
fi

# Login to ibmcloud with cli
attempts=1
until ibmcloud login -q -r "${REGION}" -g "${RESOURCE_GROUP_ID}" || [ $attempts -ge 3 ]; do
    attempts=$((attempts+1))
    echo "Error logging in to IBM Cloud CLI..." >&2
    sleep 5
done

# run api-key reset command if apikey for given region + resource group does not already exist
reset=true
#key_descriptions=()
#while IFS='' read -r line; do key_descriptions+=("$line"); done < <(ibmcloud iam api-keys --all --output json | jq -r --arg name "${APIKEY_KEY_NAME}" '.[] | select(.name == $name) | .description')
#for i in "${key_descriptions[@]}"; do
#  if [[ "$i" =~ ${REGION} ]] && [[ "$i" =~ ${RESOURCE_GROUP_ID} ]]; then
#    echo "Found key named ${APIKEY_KEY_NAME} which covers clusters in ${REGION} and resource group ID ${RESOURCE_GROUP_ID}"
#    reset=false
#    break
#  fi
#done
key_descriptions=()
ibmcloud iam api-keys --all --output json | jq -r --arg name "${APIKEY_KEY_NAME}" '.[] | select(.name == $name) | .description' | while IFS='' read -r line; do
    echo "Line read: $line" # Debug output
    key_descriptions+=("$line")
done

# Check if the array is empty
if [ ${#key_descriptions[@]} -eq 0 ]; then
    echo "No key descriptions found."
else
    # Iterate over key descriptions
    for i in "${key_descriptions[@]}"; do
        if [[ "$i" =~ ${REGION} ]] && [[ "$i" =~ ${RESOURCE_GROUP_ID} ]]; then
            echo "Found key named ${APIKEY_KEY_NAME} which covers clusters in ${REGION} and resource group ID ${RESOURCE_GROUP_ID}"
            reset=false
            break
        fi
    done
fi

if [ "${reset}" == true ]; then
  cmd="ibmcloud ks api-key reset --region ${REGION}"
  yes | "${cmd}" || echo "Error executing command: ${cmd} && exit $?"
  # sleep for 10 secs to allow the new key to be replicated across backend DB instances before attempting to create cluster
  sleep 10
fi
