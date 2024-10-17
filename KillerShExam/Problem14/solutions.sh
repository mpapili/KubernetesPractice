#! /bin/bash
echo ""
# how many master nodes are available?
kubectl get nodes --show-labels | grep -i control-plane | awk {'print $1'} 

# how many worker nodes are available?
kubectl get nodes --show-labels | grep -iw ready | grep -v control-plane | wc -l

# what is the service CIDR?
### i suspect the kube proxy has this?
##### NO that has the POD cidr, not the service cidr!
##### we need it from the kube-apiserver:
sudo grep -i range /etc/kubernetes/manifests/kube-apiserver.yaml

# which networking plugin is running? Where is its config file?
kubectl get daemonsets -A  ## figure out what's running, i see "calico!"
# then just examine the daemonset closer
kubectl get daemonsets -n calico-system calico-node -o yaml > calico.yaml

# and i found the config file
echo "I found /etc/cni/net.d/calico-kubeconfig"
echo "I also found /etc/cni/net.d/10-calico.conflist"

# which suffix will static pods have on rocky9-server-2
echo "for the last one just ssh to rocky9-server-2 and make a static pod and find out for yourself!!"
