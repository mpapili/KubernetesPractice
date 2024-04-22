#! /bin/bash

# start minikube setting profile to kubevirt
minikube start -p kubevirt --cni=flannel --memory 16384 --disk-size='50000mb'
# switch to kubevirt profile
minikube profile kubevirt
# enable the kubevirt addon for minikube
minikube addons enable kubevirt

