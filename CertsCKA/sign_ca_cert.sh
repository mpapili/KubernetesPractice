#! /bin/bash

echo "take the csr and the ca key and spit out the certificate!"
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt
