#! /bin/bash

echo "fetch details about all running nodes"
kubectl get nodes
echo ""

echo "now in json format..."
kubectl get nodes -o yaml 
echo ""

echo "now read the above and fetch the OS image and name!"
kubectl get nodes -o jsonpath='image: {.items[*].status.nodeInfo.osImage} {"\n"}name:{.items[*].metadata.name}'
echo ""

echo "now how about one? Easy!!"
kubectl get nodes -o jsonpath='image: {.items[0].status.nodeInfo.osImage} {"\n"} name:{.items[0].metadata.name}'
echo ""

echo "now how about with nice formatting?"
kubectl get nodes -o jsonpath='image: {.items[*].status.nodeInfo.osImage} {"\n"} name:{.items[*].metadata.name}'
echo ""

