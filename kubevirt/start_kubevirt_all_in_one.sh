#! /bin/bash

# run me from within project root

./enable_nonroot_vms.sh
./install_kvm2_driver.sh
./bounce_minikube.sh
./setup_kubevirt.sh
sleep 120 # just to be safe, tune this smarter. . .
minikube mount $(pwd)/minikube-share:/mnt/minikube-share
./setup_pvc.sh
sleep 10
kubectl apply -f vm.yml