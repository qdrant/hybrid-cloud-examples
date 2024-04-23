#!/bin/bash
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt focal main
EOF
# Import signing key from keyserver
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
# Alternative import from download if keyserver offline
curl https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list << EOF
deb https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse
EOF
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
sudo ufw disable
sudo apt update
sudo apt -y install \
    wireguard \
    wireguard-tools\
    unzip \
    pritunl \
    mongodb-org

sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update
sudo apt-get install azure-cli    
sudo systemctl stop pritunl mongodb
sleep 10
sudo pritunl set-mongodb mongodb://localhost:27017/pritunl
sudo systemctl enable mongod pritunl
sudo systemctl start mongod pritunl
sudo systemctl start pritunl mongodb