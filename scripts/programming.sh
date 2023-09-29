#!/bin/bash
GREEN="\e[32m"

echo "Programming configuration...."

# Installing python
if [ -n "$(which python)" ]; then
	echo "Python is already installed.. updating python"

else
	sudo dnf install python
	sudo dnf install python3-tkinter
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

if [ -n "$(which gcc)"]; then
	echo "C compiler is already installed..."
else
	echo -e "${GREEN}[!] Installing C compiler..dd"
	sudo dnf install gcc gcc-c++
fi

# Try to install java / jdk
if [ -n "$(which bun)"]; then
	echo "Bun is already installed"
else
	curl -fsSL https://bun.sh/install | bash # for macOS, Linux, and WSL
	# to install a specific version
	curl -fsSL https://bun.sh/install | bash -s "bun-v1.0.0"
fi
chmod +x "$0"
