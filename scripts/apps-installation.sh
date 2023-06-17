#!/bin/bash

echo "5. Installing all major apps..."

# Speeding up DNF:
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=5' | sudo tee -a /etc/dnf/dnf.conf
echo 'defaultyes=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'keepcache=true' | sudo tee -a /etc/dnf/dnf.conf

# Installing multimedia codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

# enabling RPM fusion packages
sudo dnf install \ https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm # free packages
sudo dnf install \ https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm # nonfree packages
sudo dnf groupupdate core # update all packages

# installing vs code 

if [ -n "$(which code)" ]; then
    echo "vs code is already installed"
else
    echo "INstalling vs code..."

    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

    echo "checking for updates..."
    dnf check-update


    echo "Installing now..."
    sudo dnf install code
    echo "Installing is done we good to go.."

fi

# installing wine 
if [ -n "$(which wine)" ]; then
    echo "wine is already installed"

else
    echo "configuring wine repository..."
    sudo dnf -y install dnf-plugins-core 
    sudo rpm --import https://dl.winehq.org/wine-builds/winehq.key

    echo "adding wine 🍷 repository..."
    source /etc/os-release 
    sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/${VERSION_ID}/winehq.repo

    echo "Installing wine 🍷 "
    sudo dnf install winehq-stable

    echo "configuring wine "
    winecfg 
fi

# Installing thefuck,
if [ -n "${which thefuck}" ]; then
    echo "Fuck!!! we good 👍🏿 "

else
    echo "Installing the fuck"
    pip install thefuck

    echo "configuring the fuck..."
    eval "$(thefuck --alias)"

    echo "applying changes ..."
    source ~/.bashrc
fi
# https://sbulav.github.io/tools/fzf-on-fedora/ Installing fuzzy finder

#installing neovim
if [ -n "${which neovim}" ]; then
    echo "Neovim is already installed"

else
    echo "Installing Neovim..."
    sudo dnf install neovim
fi

# installing onlyoffice 

if [ "${which onlyoffice}" ]; then
    echo "onlyOffice is already installed"
else
    echo "Installing only Office...."
    sudo wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm
    sudo dnf install onlyoffice-desktopeditors.rpm
fi

chmod +x "$0"   
