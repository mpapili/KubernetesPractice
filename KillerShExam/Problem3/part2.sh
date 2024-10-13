#! /bin/bash

# get statefulsets in editable yaml

kubectl get statefulset mike-stateful-set -o yaml > edit_stateful_set.yaml
