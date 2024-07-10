#! /bin/bash

echo "stopping services"
kubectl delete -f app_service.yaml
kubectl delete -f service.yaml
sleep 2

echo "stopping persistent volume claims"
kubectl delete -f pg_pv.yaml
sleep 2
kubectl delete -f pg_pvc.yaml
sleep 5

echo "stopping postgres deployment"
kubectl delete -f pgsql_deployment.yaml
sleep 5

echo "stopping main app"
kubectl delete -f deployment.yaml

echo "enjoy!"
