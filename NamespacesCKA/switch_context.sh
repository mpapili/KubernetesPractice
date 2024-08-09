#! /bin/bash
echo "before..\n"
sleep 1
kubectl get pods
sleep 1
echo "switching..\n"
kubectl config set-context --current --namespace kube-system
echo "after..\n"
sleep 1
kubectl get pods
sleep 1
echo "and back!\n"
kubectl config set-context --current --namespace default
