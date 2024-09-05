#! /bin/bash

kubectl get pods \
	--server=https://192.168.122.106:6443 \
	--client-certificate=mike.crt \
	--client-key=mike.key \
	--certificate-authority=/etc/kubernetes/pki/ca.crt
