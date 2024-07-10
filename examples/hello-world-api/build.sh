#! /bin/bash

# get our minikube's docker-env (we need to expose the image there)
# this command will configure out terminal's docker commands to 
# use the minikube's docker daemon instead of our local system's!
eval $(minikube docker-env)

# build image (within the minikube!)
docker build -t helloworld-go .

# unset the docker-env variables (we want to use our system's docker by default 
# -after this build!
eval $(minikube docker-env -u)

