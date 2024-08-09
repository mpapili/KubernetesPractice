#! /bin/bash

echo "remember you can't hit it directly, you need to open a proxy"
echo "run kubectl proxy and leave it open"
sleep 3 
curl -X POST "http://localhost:8001/api/v1/namespaces?dryRun=All" \
  -H "Content-Type: application/json" \
  -d '{
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
      "name": "test-namespace"
    }
  }'
