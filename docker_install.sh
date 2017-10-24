#!/bin/bash

# remove old version
yes | sudo apt-get remove docker docker-engine docker.io
yes | sudo apt update
#  allow Docker to use the aufs storage drivers
yes | sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

# install by repo
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
# add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
# amd64
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# install CE
sudo apt-get update
sudo apt-get install docker-ce

# add to docker group
sudo groupadd docker
sudo usermod -aG docker $USER
