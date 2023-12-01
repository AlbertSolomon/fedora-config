#!/bin/bash
echo -e "checking for updates............\n"
dnf check-update

echo -e "fetching......................\n"
dnf updateinfo
dnf updateinfo list

echo "upgrading................."
sudo dnf upgrade

echo "shutting down the computer"
sudo shutdown -r now

# reference : https://linuxopsys.com/topics/update-fedora-linux-to-get-latest-software
