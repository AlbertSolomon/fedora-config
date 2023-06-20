#!/bin/bash

echo "Programming configuration...."

# Installing python 
if [ -n "$(which python)" ]; then
    echo "Python is already installed.. updating python"
    
else 
    sudo dnf install python
    sudo dnf install pip
fi

if [ -n "$(which go)"]; then 
    echo "Go is already installed "
else 
    echo "Installing golang...."
    sudo dnf install golang
fi

if [ -n "$(which rust)"]; then
    echo "Rust is already installed.."
else
    echo "Installing Rust.."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
fi

if [ -n "$(which node)"]; then
    echo "Nodejs is already installed..."
else
    echo "Installing node js..."
    sudo dnf install nodejs
fi

chmod +x "$0"