#! /bin/bash

kubectl create secret tls tls-secret \
	--cert=/home/mike/Downloads/KubernetesPractice/Ingress_Http/certs/rocky9-server2.crt \
	--key=/home/mike/Downloads/KubernetesPractice/Ingress_Http/certs/rocky9-server2.key
