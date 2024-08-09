#! /bin/bash

echo "this will reveal what keys are available on a kubeadm server with an etcd pod"
kubectl exec -it -n kube-system etcd-rocky9-server-1 -- etcdctl --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt   --cert=/etc/kubernetes/pki/etcd/server.crt   --key=/etc/kubernetes/pki/etcd/server.key   get / --prefix --keys-only
