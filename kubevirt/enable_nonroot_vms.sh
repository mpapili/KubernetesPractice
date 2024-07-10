#! /bin/bash
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
