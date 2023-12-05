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

if [ -n "$(which postman)"]; then
	echo "postman is already installed"
else
	sudo snap install postman
fi

if [ -n "$(which java)"]; then
	echo "Java has already been installed "
else
	sudo dnf install java-latest-openjdk.x86_64
	java -version
fi

if [ -n "$(which studio)"]; then
	echo "Android Studio is already installed "
	alias android-studio="~/android-studio/bin/studio.sh"
else
	wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.3.1.20/android-studio-2022.3.1.20-linux.tar.gz
	tar -xvzf android-studio-*-linux.tar.gz
	sudo ./android-studio/bin/studio.sh
fi

if [ -n "$(which docker)"]; then
	echo "docker is already installed "
else
	sudo dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.add-repo
	sudo dnf install docker-ce
	sudo systemctl start docker
	sudo systemctl enable docker
fi

if [ -n "$(which docker-compose)"]; then
	echo "docker-compose is already installed..."
else
	sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
	#inspired by: https://computingforgeeks.com/install-and-use-docker-compose-on-fedora/#google_vignette
fi

if [ -n "$(which sqlitebrowser)"]; then
    echo "sqlitebrowser is already installed"
else
    sudo dnf install sqlitebrowser

chmod u+x "$0"
