#! /bin/bash

# get the name of our pods
kubectl get pod jsonpath-pod -o jsonpath='{.metadata.name}'

echo ""
echo ""
# let's dig a bit, can we get the image used?
# query for the IMAGE of the container running under name jsonpath-container
echo "image used by containers in pod with name jsonpath-container"
kubectl get pod jsonpath-pod -o jsonpath='{.spec.containers[?(@.name=="jsonpath-container")].image}'
echo ""
echo ""

# can we search for the sidecar container?
echo "image used by containers in pod with name sidecar-container:"
kubectl get pod jsonpath-pod -o jsonpath='{.spec.containers[?(@.name=="sidecar-container")].image}'
echo ""
echo ""


