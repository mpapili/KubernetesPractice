#! /bin/bash

kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml

echo "now lets view this"

sleep 1

kubectl get storageclass
