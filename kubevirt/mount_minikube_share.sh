#! /bin/bash

# mount minikube share
sudo firewall-cmd --permanent --zone=libvirt --add-rich-rule='rule family="ipv4" source address="192.168.39.0/24" accept'
sudo firewall-cmd --reload

nohup minikube mount $(pwd)/minikube-share:/mnt/minikube-share &