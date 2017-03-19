#!/bin/sh

# docker
sudo apt-get update
yes | sudo apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main"
sudo apt-get update
sudo apt-get -y install docker-engine
apt-cache madison docker-engine

docker-engine | 1.13.0-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
docker-engine | 1.12.6-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
docker-engine | 1.12.5-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
docker-engine | 1.12.4-0~ubuntu-xenial | https://apt.dockerproject.org/repo ubuntu-xenial/main amd64 Packages
sudo apt-get -y install docker-engine=1.13.0-0~ubuntu-xenial

# nvidia-docker
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

sudo nvidia-docker run -it -p 8888:8888 -e "PASSWORD=110010" gcr.io/tensorflow/tensorflow:latest-gpu
