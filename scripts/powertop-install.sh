#!/bin/bash

# make sure you read this guide [https://www.fosslinux.com/1599/powertop-for-fedora-helps-increase-laptops-battery-life.htm] before running this script
echo "2. Installing powertop 🚀"

if [ -n "$(which powertop)" ]; then
    echo "powertop is installed"
else
    echo "powertop is not installed... Instlling powertop"
    sudo dnf install powertop

    echo "powertop installed successfully"

    # automatically set all tunables to ‘Good, 
    echo "automatically setting all tunables to ‘Good at boot up (optimal power saving mode)"
    sudo systemctl enable powertop.service
fi

chmod +x "$0" # $0 refers the script itself
