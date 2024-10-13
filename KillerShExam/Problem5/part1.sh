#! /bin/bash

# list all pods in all namespaces
kubectl get pods -A \
	--sort-by='.metadata.creationTimestamp'
