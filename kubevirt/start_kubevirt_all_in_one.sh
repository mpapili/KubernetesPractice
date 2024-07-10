#! /bin/bash

# run me from within project root

./enable_nonroot_vms.sh
./install_kvm2_driver.sh
./bounce_minikube.sh
./setup_kubevirt.sh
sleep 120 # just to be safe, tune this smarter. . .
./mount_minikube_share
./setup_pvc.sh
sleep 10
minikube kubectl --  apply -f vm.yml