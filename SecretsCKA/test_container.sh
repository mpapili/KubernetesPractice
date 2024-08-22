#! /bin/bash

docker run -p 5000:5000 -e my-secret=testsecret123 secret-server
