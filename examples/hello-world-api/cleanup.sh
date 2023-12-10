#! /bin/bash

# deploy using your deployment files
## kubectl apply -f helloworld-deployment.yaml

# expose the container's port 8080
## kubectl expose deployment helloworld-deployment --type=NodePort --port=8080
kubectl delete deployment helloworld-deployment
kubectl delete service helloworld-deployment

