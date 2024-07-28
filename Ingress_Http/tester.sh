#! /bin/bash

# replace the Host with the domain that your ingress expects
echo "replace the IP with the IP that your ingress shows; note it takes ~45 seconds to assign an IP"
for i in {1..100}; do
	curl https://rocky9-server2.nip.io
done
