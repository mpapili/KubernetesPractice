#! /bin/bash

# tokens are stored on the pods if the service account is associated with them!
kubectl exec -it test-service-account -- cat /var/run/secrets/kubernetes.io/serviceaccount/token
