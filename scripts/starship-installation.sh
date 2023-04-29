#!/bin/bash
INIT_COMMAND='eval "$(starship init bash)"'

if [ -n "$(which starship)" ]; then
    echo "Starship 🚀 is already installed !!!"
    # echo 'eval "$(starship init bash)"' >> ~/.bashrc
else
    echo "Installing Starship. 🚀"

    curl -sS https://starship.rs/install.sh | sh
    chmod +x install_starship.sh # run ./starship-installation.sh

    echo "adding >> eval "$(starship init bash)" to ~/.bashrc file"
    echo "$INIT_COMMAND"

fi

# Installing Gogh and all its themes.