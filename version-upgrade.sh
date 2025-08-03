#!/bin/bash
echo -n "Enter New Version of Fedora: "
read VERSION_INPUT

CURRENT_VERSION=41

if [[ $VERSION_INPUT -gt $CURRENT_VERSION ]]; then
    echo "Updating packages, and refleshing the os"
    sudo dnf upgrade --refresh --skip-broken
    sudo dnf install dnf-plugin-system-upgrade

    sudo dnf system-upgrade download --releasever= $VERSION_INPUT
    sudo dnf system-upgrade reboot
    #echo "upgrading to $VERSION_INPUT"
else
    echo "There should be a problem with the version you entered...!"
fi

#refer to : https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
