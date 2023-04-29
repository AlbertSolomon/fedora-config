#!/bin/bash

if [ -n "$(which starship)" ]; then
    echo "Starship 🚀 is already installed !!!"

else
    echo "Installing Starship. 🚀"

    curl -sS https://starship.rs/install.sh | sh
    chmod +x install_starship.sh # run ./starship-installation.sh
fi

