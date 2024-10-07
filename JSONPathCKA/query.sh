#! /bin/bash

kubectl get nodes -o jsonpath='{.items[?(@metadata.name=="rocky9-server-1")].metadata.name}'
