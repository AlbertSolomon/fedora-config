#!/bin/bash

echo "Asus on Linux"

# Define the files to modify
files=("/etc/yum.repos.d/fedora.repo" "/etc/yum.repos.d/fedora-updates.repo" "/etc/yum.repos.d/fedora-updates-testing.repo")

# Define the exclude command to add
exclude_command="exclude=kernel kernel-core kernel-devel"

# Check if the exclude command already exists in each file
for file in "${files[@]}"
do
    if grep -Fxq "$exclude_command" "$file"
        then
            echo "Exclude command already exists in $file"
        else
            echo "Exclude command does not exist in $file, adding it now..."
            sudo echo "$exclude_command" >> "$file"
            echo "Exclude command added to $file"
        fi
done

read -p "Is your laptop older than 2022? (y/n): " answer

# check if repo is already enabled
if [ "$answer" == "y" ]; then
    sudo dnf copr enable lukenukem/asus-linux

elif [ "$answer" == "n" ]; then
    sudo dnf copr enable lukenukem/asus-kernel

else
    echo "Invalid input. Please enter 'y' for yes or 'n' for no."
    exit 1
fi

echo "
    UPDATE THE SOFTWARE STORE LIKE SO:
    1.Open Software store
    2.Navigate to Updates tab
    3.Click the Refresh-button in the top left corner
    4.Download all available updates
    "

if [ -n "$(which asusctl)" ]; then
    echo " asusctl is installed ...!
    
    "
else
    echo "Installing asusctl ..."
    sudo dnf install asusctl supergfxctl
    sudo dnf update --refresh

    echo "enabling 🐧 asusctl..."
    sudo systemctl enable supergfxd.service
fi

read -p "do you wish to install ROG-GUI? (y/n)" option
if [ "$option" = "y" ]; then
    sudo dnf install rog-gui

elif [ "$option" = "n" ]; then
    echo "setup complete ..."

else
    echo "Invalid input. Please enter 'y' for yes or 'n' for no."
    exit 1
fi

# try to run this on boot up
systemctl start asusd

chmod +x "$0"