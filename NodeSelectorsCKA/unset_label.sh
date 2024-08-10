#! /bin/bash

echo "first lets look at labels"

kubectl get node rocky9-server-2 --show-labels

echo "now delete"

# delete with <key>- (followed by minus "-" !)
kubectl label node rocky9-server-2 size-
