#! /bin/bash

# show the taints
kubectl describe node rocky9-server-4
echo "to unset a taint, it's the same command as setting it - just with a minus at the end!"
kubectl taint nodes rocky9-server-4 app=mikes-app:NoSchedule-  # notice the minus?

