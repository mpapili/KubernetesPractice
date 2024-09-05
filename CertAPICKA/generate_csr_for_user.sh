#! /bin/bash

openssl genrsa -out mike.key 2048
openssl req -new -key mike.key -out mike.csr -subj "/CN=mike-user"

