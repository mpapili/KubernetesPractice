#! /bin/bash

kubectl get configmaps -n kube-system | grep -i dns
