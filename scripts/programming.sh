#!/bin/bash

echo "Programming configuration...."

# Installing python 
if [ -n "$(which python)" ]; then
    echo "Python is already installed.. updating python"
    
else 
    sudo dnf install python
    sudo dnf install pip
fi

chmod +x "$0"