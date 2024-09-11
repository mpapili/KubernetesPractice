#! /bin/bash

docker run -it --rm -v mikes_volume:/target  docker-registry:5000/fedora:39 /bin/bash 
