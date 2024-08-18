#! /bin/bash

echo "status:"
kubectl rollout status deployment/fedora-deploy
sleep 1

echo "history:"
kubectl rollout history deployment/fedora-deploy
sleep 1
