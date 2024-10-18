#! /bin/bash

kubectl get pods testpod -o wide
### from the worker node running testpod, ssh into it
crictl ps | grep -i testpod | awk {'print $1'}

