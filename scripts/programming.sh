#!/bin/bash

echo "Programming configuration...."

# Installing python 
if [ -n "$()" ]; then
    echo "Python is already installed.. updating python"
    
else 
    sudo dnf install python
fi

chmod +x "$0"