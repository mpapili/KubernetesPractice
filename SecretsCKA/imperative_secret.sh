#! /bin/bash

# believe it or not, this is not a real password
kubectl create secret generic mikes-secret --from-literal=my-secret=testsecret1234 --dry-run=client -o yaml > my-secret.yaml
