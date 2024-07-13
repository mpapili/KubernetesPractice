#! /bin/bash

echo "we need to make a token - and therefore a secret resource for our role account"
# create the secret
kubectl create secret generic mikes-account-token --from-literal=token=$(openssl rand -base64 32) -n default
# patch 'mikes-account' adding 'secrets'
kubectl patch serviceaccount mikes-account -p '{"secrets": [{"name": "mikes-account-token"}]}' -n default


echo "first lets get the secret name"
SECRET_NAME=$(kubectl get sa mikes-account -n default -o jsonpath='{.secrets[0].name}')

echo "it's ${SECRET_NAME}"

echo "now with the secret name, let's get that token"
TOKEN=$(kubectl get secret ${SECRET_NAME} -n default -o jsonpath='{.data.token}' | base64 --decode)
echo "token is ${TOKEN}"

echo "super easy now.. let's try and use it"

echo "the following should succeed:"
kubectl get pods -n default --token="$TOKEN"

echo "the following should FAIL:"
#kubectl run nginx --image=docker-registry:5000/nginx -n default --token="${TOKEN}"
# NOTE - the above will only work if you are not a linux user with an admin .kubeconfig
kubectl run nginx --image=docker-registry:5000/nginx -n default --as=system:serviceaccount:default:mikes-account
