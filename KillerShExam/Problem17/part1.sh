#! /bin/bash

kubectl run testpod --image=docker-registry:5000/alpine --dry-run=client -o yaml > pod.yaml
kubectl apply -f pod.yaml
