#! /bin/bash

VERSION="1.1.0"

# get operator
kubectl create -f https://github.com/kubevirt/kubevirt/releases/download/v${VERSION}/kubevirt-operator.yaml

# deploy operator
kubectl create -f https://github.com/kubevirt/kubevirt/releases/download/v${VERSION}/kubevirt-cr.yaml
   
# check deployment (look for running pods for kubevirt operator)
kubectl get pods -n kubevirt

# healthcheck (should return “deployed”
sleep 20 # arbitray, but needed if you really want to use the following for-loop on my system...
output=$(kubectl get kubevirt.kubevirt.io/kubevirt -n kubevirt -o=jsonpath='{.status.phase}')

echo "output is $output"
while [ "$output" == "Deploying" ]
do
    echo "still deploying. . ."
    sleep 3
    output=$(kubectl get kubevirt.kubevirt.io/kubevirt -n kubevirt -o=jsonpath='{.status.phase}')
done

echo "Final output was ${output}!"