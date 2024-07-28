#! /bin/bash

echo "running apache benchmark"

# run the httpd imach and run the apache benchmark against our nginx server
kubectl run -i --tty load-generator \
	--rm \
	--image=docker-registry:5000/httpd \
	--restart=Never \
	-- /bin/sh \
	-c "apt-get update && apt-get install -y apache2-utils && ab -n 500000 -c 50 http://nginx.default.svc.cluster.local/"
