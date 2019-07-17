#!/bin/bash

if [ ! $1 ]; then
  VERSION=$(curl -s https://releases.hashicorp.com/terraform/ | grep terraform | head -1 | cut -d\/ -f3)
else
  VERSION=$1
fi

if [ $(which terraform) ]; then
  INSTALL_PATH=$(which terraform)
else
  INSTALL_PATH="/usr/local/bin/"
fi

echo "Version to be installed: $VERSION"
wget -q https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip
unzip -q terraform_${VERSION}_linux_amd64.zip

echo "Installing Terraform to $INSTALL_PATH"
sudo cp ./terraform $INSTALL_PATH

echo "Cleaning up"
rm terraform
rm terraform_${VERSION}_linux_amd64.zip

echo "Verifying the Installation"
terraform version
