#! /bin/bash


echo "don't forget to RUN the etcd server inside this"
# start container running server
docker run -it --rm bitnami/etcd etcd
sleep 1

# start client session within container
#CONTAINER_ID=$(docker ps | grep -i etcd | awk {'print $1'})
#docker exec -it ${CONTAINER_ID} /bin/bash

