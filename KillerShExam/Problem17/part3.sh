#! /bin/bash

# on node running pod

ssh rocky9-server-2 "crictl inspect $(crictl ps | grep -i <podname> | awk {'print $1'}) | grep -i runtimetype"
