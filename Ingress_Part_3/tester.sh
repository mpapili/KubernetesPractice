#! /bin/bash

# replace the Host with the domain that your ingress expects
echo "replace the IP with the IP that your ingress shows; note it takes ~45 seconds to assign an IP"
curl http://10.97.220.152 -H "Host: rocky9-server2.nip.io"
