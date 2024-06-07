#!/bin/bash

set -e

CONFIGMAP_NAME="iks-ca-configmap"
NAMESPACE="kube-system"
COUNTER=0
MAX_ATTEMPTS=40

while [[ $COUNTER -lt $MAX_ATTEMPTS ]] && ! kubectl get configmap $CONFIGMAP_NAME -n $NAMESPACE &>/dev/null; do
  COUNTER=$((COUNTER + 1))
  echo "Attempt $COUNTER: ConfigMap '$CONFIGMAP_NAME' not found in namespace '$NAMESPACE', retrying..."
  sleep 60
done

if [[ $COUNTER -eq $MAX_ATTEMPTS ]]; then
  echo "ConfigMap '$CONFIGMAP_NAME' did not become available within $MAX_ATTEMPTS attempts."
  #  Output for debugging
  kubectl get configmaps -n $NAMESPACE
  exit 1
else
  echo "ConfigMap '$CONFIGMAP_NAME' is now available." >&2
fi
