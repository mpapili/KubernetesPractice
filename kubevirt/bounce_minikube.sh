#! /bin/bash

# delete minikube
minikube delete
# 8 cores and 32gb of RAM
minikube start --cpus 8 --memory 32000 --disk-size 50GiB