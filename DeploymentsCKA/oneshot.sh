#!

kubectl create deployment my-oneshot-app --image=docker-registry:5000/nginx --dry-run=client -o yaml
