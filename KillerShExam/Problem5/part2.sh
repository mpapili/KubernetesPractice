#! /bin/bash

kubectl get pods -A \
	--sort-by='metadata.uid'
