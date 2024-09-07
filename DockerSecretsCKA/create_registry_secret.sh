#! /bin/bash

kubectl create secret docker-registry my-docker-reg-secret \
	--docker-username=testusername \
	--docker-password=testpassword \
	--docker-server=nonsenseserver \
	--docker-email=fake@fakeemailnotreal.com
