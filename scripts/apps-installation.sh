#!/bin/bash

echo "Installing all major apps..."

# installing vs code 

if [ -n "$(which code)" ]; then
    echo "vs code is already installed"
else
    echo "INstalling vs code..."
    
chmod +x "$0"