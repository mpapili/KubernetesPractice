#! /bin/bash

kubectl create deployment my-app --image docker-registry:5000/test-py:1.0.1 --dry-run=client -o yaml > deployment.yaml
kubectl create service nodeport my-app --tcp=5000:5000 --dry-run=client -o yaml > service.yaml
