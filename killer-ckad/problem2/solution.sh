#! /bin/bash

kubectl apply -f pod.yaml

### use jsonpath!!
kubectl get pod pod1 -o jsonpath="{.status.phase}"
