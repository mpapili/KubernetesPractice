#! /bin/bash

kubectl create secret tls my-tls-secret --cert=app_certs/server.crt --key=app_certs/server.key 


