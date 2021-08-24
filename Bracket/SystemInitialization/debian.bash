#!/usr/bin/env bash

# check Network
ping -c 4 www.baidu.com && \
  [ $? -ne 0 ] && echo "ERROR: The network is not smooth" && exit 1;

# apt initialization
sudo apt -y update && apt -y upgrade && apt -y full-upgrade && apt -y autoclean && apt -y autoremove
# Download the required basic package
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release wget make gcc automake autoconf libtool



# install docker
##  Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

## download docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

## Perfect docker configure
### Set up docker auto start and reload the docker
sudo systemctl enable docker && sudo systemctl daemon-reload
### restart docker
systemctl restart docker
