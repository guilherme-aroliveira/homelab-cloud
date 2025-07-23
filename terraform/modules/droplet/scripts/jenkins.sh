#!/bin/bash

apt-get update -y
apt-get install -y dnsutils net-tools htop gnupg git ca-certificates curl unzip build-essential libssl-dev pkg-config 

# add docker's official GPG key:
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# add the repository to Apt sources:
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y

# install docker
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
usermod -aG docker $USER

# create droplet directories
mkdir bookstack jenkins newrelic prometheus

# mount volume to droplet 
DEVICE="/dev/disk/by-id/scsi-0DO_Volume_jenkins-volume"
if [ "$(blkid -o value -s TYPE $DEVICE)" == "" ]; then
    mkfs.ext4 $DEVICE
fi
mkdir -p /mnt/jenkins
echo "$DEVICE /mnt/jenkins ext4 defaults 0 0" >> /etc/fstab
mount /mnt/jenkins

