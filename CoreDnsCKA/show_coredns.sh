#! /bin/bash

echo "PODS"
kubectl get pods -n kube-system -o wide | grep -i coredns

echo "REPLICASETS"
kubectl get replicasets -n kube-system | grep -i coredns
