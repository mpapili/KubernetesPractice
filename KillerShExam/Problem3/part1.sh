#! /bin/bash

# switch cluster and check resources

kubectl config get-contexts
## kubectl config user-context <DESIRED_CONTEXT_NAME>

# check for all resources that control replicas!!!
kubectl get deployments
kubectl get replicasets
kubectl get statefulsets

# orrrr...
kubectl get all  # in your current context!
