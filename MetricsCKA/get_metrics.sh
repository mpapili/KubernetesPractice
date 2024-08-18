#! /bin/bash

echo "first pods:"
sleep 1
kubectl top pod
sleep 1
echo "now nodes:"
sleep 1
kubectl top node
sleep 1
