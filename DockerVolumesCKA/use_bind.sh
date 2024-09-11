#! /bin/bash

docker run -it --rm -v $(pwd)/directory_for_bind:/target docker-registry:5000/fedora:39 /bin/bash
