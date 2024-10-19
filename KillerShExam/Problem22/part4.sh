#! /bin/bash

# based on output from kubeadm certs check-expiration
kubeadm certs renew apiserver
