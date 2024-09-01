#! /bin/bash

echo "first the key"
openssl genrsa -out admin.key 2048

echo "then we make a certificate request"
openssl req -new -key admin.key -out admin.csr

echo "then we use our CA we made earlier to sign it!"
openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key  -out admin.crt 
