#! /bin/bash

echo "THIS MAY CAUSE ISSUES"

# install kvm2 driver
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2
sudo install docker-machine-driver-kvm2 /usr/local/bin/

# configure minikube to use it
minikube config set driver kvm2