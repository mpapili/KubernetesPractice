#! /bin/bash

### I kid you not, he suggests just going through the namespaces
### and counting them all with :
kubectl get namespaces
kubectl get roles -n <namespace> | grep -v name | wc -l
	### if they make too many namespaces i will just write a python script
	### the test environment is ubuntu and ubuntu ships with python so.. fair game?
