#! /bin/bash

# update image to use v2
kubectl set image deployment/hello-from-localhost hello-from-localhost=registry:5000/hello-from-localhost:v2
