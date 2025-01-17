#!/bin/bash

DOCKERVERSION="19.03.1"

sudo dpkg -l | grep docker && { echo "[Vagrant] ###################     Docker already installed, exiting"; exit; }

echo "[Vagrant] ###################     Installing docker"

sudo apt-get update > /dev/null

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88 || { echo "[Vagrant] ###################     Fingerprint error, exiting"; exit; }

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt-get update > /dev/null
sudo apt-get install -y "docker-ce-cli=5:${DOCKERVERSION}~3-0~ubuntu-bionic" > /dev/null || { echo "[Vagrant] ###################     Installation error, exiting"; exit; }
sudo apt-get install -y "docker-ce=5:${DOCKERVERSION}~3-0~ubuntu-bionic" > /dev/null || { echo "[Vagrant] ###################     Installation error, exiting"; exit; }

echo "[Vagrant] ###################     Installation complete"

sudo usermod -aG docker vagrant
sudo apt-mark hold docker-ce
