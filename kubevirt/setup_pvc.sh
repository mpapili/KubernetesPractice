#! /bin/bash

echo "you may have to hit enter/return once"
./mount_minikube_share.sh

kubectl apply -f vm-image-pv.yml

sleep 5

kubectl apply -f vm-image-pvc.yml