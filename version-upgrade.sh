#!/bin/bash
echo -n "Enter New Version of Fedora: "
read VERSION_INPUT

echo "Updating packages, and refleshing the os"
CURRENT_VERSION = 41

if ["$VERSION_INPUT" > "$CURRENT_VERSION"]; then

    sudo dnf upgrade --refresh --skip-broken
    sudo dnf install dnf-plugin-system-upgrade
    sudo dnf system-upgrade download --releasever= $CURRENT_VERSION
    sudo dnf system-upgrade reboot
    
else
    echo "There should be a problem with the version you entered...!"
# refer to : https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
