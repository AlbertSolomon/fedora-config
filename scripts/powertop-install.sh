#!/bin/bash

if [ -n "$(which powertop)" ]; then
    echo "powertop is installed"
else
    echo "powertop is not installed... Instlling powertop"
    sudo dnf install powertop
    
fi

chmod +x "$0" # $0 refers the script itself