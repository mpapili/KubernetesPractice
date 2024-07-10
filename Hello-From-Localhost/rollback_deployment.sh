#! /bin/bash

# oh no, v2 is bad, roll back to v1
kubectl rollout undo deployment/hello-from-localhost
