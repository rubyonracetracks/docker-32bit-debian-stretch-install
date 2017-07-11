#!/bin/bash

# To run this script, enter the following command:
# sh main.sh

# This script installs Docker on your host machine and logs the screen output.

DATE=`date +%Y_%m%d_%H%M`
mkdir log
sh docker-host.sh 2>&1 | tee log/install-docker-$DATE.txt

# Change current group ID
echo 'newgrp docker' | tee -a log/install-docker-$DATE.txt
newgrp docker | tee -a log/install-docker-$DATE.txt # Hangs in docker-host.sh
