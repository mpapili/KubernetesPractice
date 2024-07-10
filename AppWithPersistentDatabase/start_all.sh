#! /bin/bash

echo "starting services"
kubectl apply -f app_service.yaml
kubectl apply -f service.yaml
sleep 2

echo "starting persistent volume claims"
kubectl apply -f pg_pv.yaml
sleep 2
kubectl apply -f pg_pvc.yaml
sleep 5

echo "starting postgres deployment"
kubectl apply -f pgsql_deployment.yaml
sleep 5

echo "starting main app"
kubectl apply -f deployment.yaml

echo "enjoy!"
