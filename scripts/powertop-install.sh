#!/bin/bash

if [ -n "$(which powertop)" ]; then
    echo "powertop is installed"
else
    echo "powertop is not installed... Instlling powertop"
fi

chmod +x "$0"