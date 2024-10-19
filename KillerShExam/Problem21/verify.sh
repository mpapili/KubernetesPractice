#! /bin/bash

kubectl run -it testpod --image=docker-registry:5000/ubuntu -- /bin/bash -c 'apt-get update -y && apt-get install curl -y && curl nginx-static-rocky9-server-1
