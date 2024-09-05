#! /bin/bash

# fetch it!
kubectl get csr mike-user-csr -o yaml

# now copy the 'certificate' and run it through base64

###echo '<certificate>' | base64 --decode
