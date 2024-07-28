#! /bin/bash

# add repo for ingress controller
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# install nginx ingress controller
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace


