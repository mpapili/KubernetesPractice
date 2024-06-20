#! /bin/bash

echo "this script will generate a kubernetes secret"
kubectl create secret generic my-secret --from-literal=API_TOKEN=password12345
