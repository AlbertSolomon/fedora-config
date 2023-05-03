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
    sudo snap install auto-cpufreq

    echo "running auto-cpufreq on boot up"
    sudo systemctl enable --now auto-cpufreq.service

    echo "auto-cpufreq does not work well with -->  intel_pstate/amd-pstate ::: consider changing it to acpi-cpufreq by adding the following commands in GRUB for intel and AMD respectively:"
    echo "copy this and add it to GRUB::intel::--> GRUB_CMDLINE_LINUX_DEFAULT="quiet splash intel_pstate=disable" ::AMD::--> GRUB_CMDLINE_LINUX_DEFAULT="quiet splash initcall_blacklist=amd_pstate_init amd_pstate.enable=0""
    echo "lunching nano::-->"
    sudo nano /etc/default/grub
fi

chmod +x "$0"