#! /bin/bash

# create a config-map to mount the init-db file
kubectl create configmap init-db-script --from-file=init-db.sql


# deploy the database container
kubectl apply -f mysql-deployment.yaml
# deploy the service (to allow us to connect)
kubectl apply -f mysql-service.yaml

