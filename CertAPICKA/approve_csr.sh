#! /bin/bash

# list them out
kubectl get csr
# approve the ones you trust
kubectl certificate approve mike-user-csr
