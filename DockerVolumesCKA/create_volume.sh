#! /bin/bash

docker volume create mikes_volume

sleep 1

echo "now let's list it out"

docker volume ls
