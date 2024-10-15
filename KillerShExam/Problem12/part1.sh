#! /bin/bash

### create our deployment skeleton

kubectl create deployment fake-daemonset \
	--image=docker-registry:5000/ubuntu \
	--dry-run=client \
	-o yaml > deploy.yaml
