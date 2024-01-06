#!/bin/bash
echo "Updating packages, and refleshing the os"
sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=39
sudo dnf system-upgrade reboot
# refer to : https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
