#! /bin/bash

kubectl delete deployment data-api
kubectl delete deployment data-writer
kubectl delete deployment mysql
kubectl delete service mysql

