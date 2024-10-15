#! /bin/bash

### first let's 'disable' our static kube-scheduler

### backup first of course
sudo cp /etc/kubernetes/manifests/kube-scheduler.yaml kube-scheduler.yaml.backup

### now let's move it
sudo mv /etc/kubernetes/manifests/kube-scheduler.yaml /tmp/kube-scheduler.yaml
