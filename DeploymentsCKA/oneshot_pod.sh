#! /bin/bash

kubectl run mypod --image=docker-registry:5000/nginx --dry-run=client -o yaml
