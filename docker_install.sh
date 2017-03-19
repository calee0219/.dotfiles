#!/bin/sh

yes | sudo apt update
yes | sudo apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

yes | sudo apt-get -y --no-install-recommends install \ curl \ apt-transport-https \ ca-certificates \ curl \ software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main"

yes | sudo apt-get update

yes | sudo apt-get -y install docker-engine


apt-cache madison docker-engine

docker-engine | 1.13.0-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
docker-engine | 1.12.6-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
docker-engine | 1.12.5-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
docker-engine | 1.12.4-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages

sudo apt-get -y install docker-engine=1.13.0-0~ubuntu-xenial
