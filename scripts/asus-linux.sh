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

chmod +x "$0"