#! /bin/bash

kubectl get pods -A --sort-by=".metadata.creationTimestamp"
kubectl get pods -A --sort-by=".metadata.uid"

