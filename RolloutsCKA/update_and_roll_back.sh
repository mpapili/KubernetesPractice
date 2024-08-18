#! /bin/bash

echo "updating"
kubectl apply -f rolling-update-deployment.yaml 


kubectl rollout status deployment/fedora-deploy 
sleep 1
echo "what images are we running?"
kubectl describe pods | grep -w "Image:"

sleep 5
echo "rolling back"
kubectl rollout history deployment/fedora-deploy
kubectl rollout undo deployment/fedora-deploy

kubectl rollout status deployment/fedora-deploy
sleep 5
kubectl rollout history deployment/fedora-deploy
kubectl get pods
