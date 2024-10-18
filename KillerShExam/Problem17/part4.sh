#! /bin/bash

ssh rocky9-server-2 "crictl logs $(crictl ps | grep -i testpod | awk {'print $1'})"
