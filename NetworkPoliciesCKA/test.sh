#! /bin/bash

# TODO - wrap in kubectl exec
API_POD=$(kubectl get pods | grep "api-deploy" | awk {'print $1'}) 
FRONTEND_POD=$(kubectl get pods | grep "frontend-deploy" | awk {'print $1'})
echo "let's hit the DB from our api pod"
kubectl exec -it $API_POD -- curl netpolicy-db-deploy:5000
echo ""

sleep 2
echo "now let's try hitting it from our frontend pod:"
sleep 1
echo "(this should hang..)"
kubectl exec -it $FRONTEND_POD -- curl netpolicy-db-deploy:5000

