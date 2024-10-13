#! /bin/bash

grep -i current-context /home/mike/.kube/config | awk {'print $2'}
