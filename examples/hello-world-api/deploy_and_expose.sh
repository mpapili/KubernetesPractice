#! /bin/bash

# deploy using your deployment files
kubectl apply -f helloworld-deployment.yaml

# expose the container's port 8080
kubectl expose deployment helloworld-deployment --type=NodePort --port=8080

# find and print the service URL
minikube service helloworld-deployment --url

