#! /bin/bash

### daemonsets are literally deployments of a different kind, use that as a skeleton
kubectl create deployment daemon-deployment --image=docker-registry:5000/nginx --dry-run=client -o yaml > daemonset.yaml
