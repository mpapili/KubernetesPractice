#! /bin/bash

# with kubectl
kubectl config get-contexts

# without kubectl
grep -i current ~/.kube/config | awk {'print $2'}
