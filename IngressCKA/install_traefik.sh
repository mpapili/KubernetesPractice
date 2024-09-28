#! /bin/bash

echo "let's install our ingress-controller, traefik! It's a bunch of k8s native objects, so let's use helm"

helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik
