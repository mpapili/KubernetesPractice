#! /bin/bash

# write the names of all namespaced k8s resources
kubectl api-resources --namespaced=true | awk {'print $1'}
