#! /bin/bash

### create a skeleton as a deployment then switch to stateful set
kubectl create deployment --image=rockylinux:9 teststatefulset --replicas 2 --dry-run=client -o yaml > statefulset.yaml

