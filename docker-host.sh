#!/bin/bash

# Update software list
echo '-------------------'
echo 'sudo apt-get update'
sudo apt-get update

# Generates, encrypts, and saves passwords
echo '--------------------------------'
echo 'sudo apt-get install -y keepassx'
sudo apt-get install -y keepassx

# Editor
echo '-----------------------------'
echo 'sudo apt-get install -y geany'
sudo apt-get install -y geany

# File search
echo '------------------------------------'
echo 'sudo apt-get install -y searchmonkey'
sudo apt-get install -y searchmonkey

# View SQLite database
echo '-------------------------------------'
echo 'sudo apt-get install -y sqlitebrowser'
sudo apt-get install -y sqlitebrowser

# View PostgreSQL database
echo '--------------------------------'
echo 'sudo apt-get install -y pgadmin3'
sudo apt-get install -y pgadmin3

echo '+++++++++++++++++++++++'
echo 'Begin installing Docker'
echo '+++++++++++++++++++++++'

# Prerequisites for Docker
echo '------------------------------------'
echo 'sudo apt-get install -y libapparmor1'
sudo apt-get install -y libapparmor1

echo '--------------------------------------'
echo 'sudo apt-get install -y cgroupfs-mount'
sudo apt-get install -y cgroupfs-mount

# Add backports
echo '----------------'
echo 'Adding backports'
echo 'deb http://http.debian.net/debian jessie-backports main' | sudo tee /etc/apt/sources.list.d/backports.list
sudo apt-get update

# Install Docker
echo '--------------------'
echo 'Installing docker.io'
sudo apt-get install -y docker.io

# Remove backports
echo '----------------'
echo 'Remove backports'
sudo rm /etc/apt/sources.list.d/backports.list
sudo apt-get update

# Provide non-root access to Docker
echo '---------------------------------'
echo 'Provide non-root access to Docker'
echo
echo 'sudo groupadd docker'
sudo groupadd docker

echo "sudo gpasswd -a ${LOGNAME} docker"
sudo gpasswd -a ${LOGNAME} docker

echo '---------------------------'
echo 'sudo service docker restart'
sudo service docker restart

wait

sh docker-version.sh
