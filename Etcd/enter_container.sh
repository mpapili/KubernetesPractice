#! /bin/bash

CONTAINER_ID=$(docker ps | grep -i etcd | awk {'print $1'})
docker exec -it ${CONTAINER_ID} /bin/bash
