#! /bin/bash

# before running, cd into each directory and run the build script

# be sure to run "minikube start" if applicable

# create a config-map to mount the init-db file
kubectl create configmap init-db-script --from-file=./db/init-db.sql

# deploy the database container
kubectl apply -f mysql-deployment.yaml
# deploy the service (to allow us to connect)
kubectl apply -f mysql-service.yaml

# deploy a microservice to occassionally add rows over time
kubectl apply -f data-writer-deployment.yaml

kubectl apply -f api-deployment.yaml
kubectl expose deployment data-api --type=NodePort --port=8080

echo "sleeping for 5 seconds to allow services to start. . ."
sleep 5

echo "Your API should be reachable at"
minikube service data-api --url
echo "-..with the '/data' path"


