#!/bin/bash

echo "Installing all major apps..."

# installing vs code 

if [ -n "$(which code)" ]; then
    echo "vs code is already installed"
else
    echo "INstalling vs code..."

    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    
chmod +x "$0"