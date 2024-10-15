#! /bin/bash

kubectl auth can-i create secrets --as processor -n hamster
kubectl auth can-i create configmaps --as processor -n hamster

