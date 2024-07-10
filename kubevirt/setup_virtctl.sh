#! /bin/bash

curl -LO https://github.com/kubevirt/kubevirt/releases/download/v1.2.0/virtctl-v1.2.0-linux-amd64
chmod +x virtctl-v1.2.0-linux-amd64
sudo mv virtctl-v1.2.0-linux-amd64 /usr/local/bin/virtctl