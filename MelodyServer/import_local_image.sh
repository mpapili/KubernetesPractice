#! /bin/bash

echo "importing image to k3d cluster"
k3d image import melody-server -c mikescluster
