#! /bin/bash

# create our skeleton

kubectl run pod1 --image=docker-registry:5000/nginx --dry-run=client -o yaml > pod.yaml
