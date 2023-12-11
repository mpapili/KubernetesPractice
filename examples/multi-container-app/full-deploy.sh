#! /bin/bash

# before running, cd into each directory and run the build script

# be sure to run "minikube start" if applicable

# create a config-map to mount the init-db file
kubectl create configmap init-db-script --from-file=./db/init-db.sql

# deploy the database container
kubectl apply -f full-app-deployment.yaml
kubectl expose deployment data-api --type=NodePort --port=8080

echo "Your API should be reachable at"
minikube service data-api --url
echo "-..with the '/data' path"


