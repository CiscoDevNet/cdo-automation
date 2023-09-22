#!/bin/bash
cd /tmp
sudo apt-get update && sudo apt-get install -y wget
wget -O terraform.zip https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip
unzip terraform.zip
sudo mv terraform /usr/bin