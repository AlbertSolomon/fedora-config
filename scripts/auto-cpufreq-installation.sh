#!/bin/bash

echo "1. Installing auto-cpufreq"

# for installation we shall first install and enable snaps 
echo "installing snaps... 🚀"

if [ -n "$(which snap)" ]; then
    echo "snaps are installed "
else
    sudo dnf install snapd

fi

chmod +x "$0"