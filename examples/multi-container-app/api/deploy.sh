#! /bin/bash

kubectl apply -f api-deployment.yaml
kubectl expose deployment data-api --type=NodePort --port=8080

echo "Your API should be reachable at"
minikube service data-api --url
echo "-..with the '/data' path"

