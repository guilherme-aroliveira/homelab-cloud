#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y dnsutils net-tools htop gnupg git ca-certificates curl unzip build-essential libssl-dev pkg-config 

# add docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# add the repository to Apt sources:
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER

# create droplet directories
sudo mkdir bookstack jenkins newrelic prometheus

# mount volume to droplet 
DEVICE="/dev/disk/by-id/scsi-0DO_Volume_jenkins-volume"
if [ "$(blkid -o value -s TYPE $DEVICE)" == "" ]; then
    mkfs.ext4 $DEVICE
fi
sudo mkdir -p /mnt/jenkins
sudo echo "$DEVICE /mnt/jenkins ext4 defaults 0 0" >> /etc/fstab
sudo mount /mnt/jenkins