#!/bin/bash

echo "1. Installing auto-cpufreq"

# for installation we shall first install and enable snaps 
echo "installing snaps... 🚀"

if [ -n "$(which snap)" ]; then
    echo "snaps are installed "
else
    sudo dnf install snapd

    # enabling snaps 
    echo "enabling snaps ..."
    sudo ln -s /var/lib/snapd/snap /snap

    # verifying snap installation
    if [ -n "$(snap version)" ]; then
        snap version
        echo "snap installation was successful"
    else
        echo "snap installation failed, Please try again ..."
    fi 
fi

if [ -n "$(auto-cpufreq --version)" ]; then
    auto-cpufreq --version
    echo "auto-cpufreq is already installed !!!"
else
    echo "lets goooooo"
fi

chmod +x "$0"