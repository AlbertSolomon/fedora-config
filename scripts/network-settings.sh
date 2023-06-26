#!/bin/bash

echo " Configuring network settings 🚀"
sudo touch /etc/NetworkManager/conf.d/20-connectivity-fedora.conf
echo "Configuration will be effective upon reboot..."

chmod +x "$0"
