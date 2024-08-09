#! /bin/bash

# a taint for key=app, value=mikesapp of type NoSchedule
kubectl taint nodes rocky9-server-4 app=mikes-app:NoSchedule
