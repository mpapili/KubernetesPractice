#! /bin/bash

kubectl get role read-pods -n default -o yaml
kubectl get rolebinding read-pods-binding -n default -o yaml
kubectl get clusterrolebindings -o yaml
kubectl get rolebindings -n default -o yaml

