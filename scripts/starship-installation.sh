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

# Installing Gogh color scheme and all its themes.

if bash -c "$(wget -qO- https://git.io/vQgMr &>/dev/null)"; then
    echo "The Gogh color scheme ⾊ is installed."
else
    echo "The Gogh color scheme ⾊ is not installed. Attempting to install..."

    if bash -c "$(wget -qO- https://git.io/vQgMr)"; then
        echo "The Gogh color scheme ⾊ was installed successfully."
    else
        echo "Failed to install the Gogh color scheme ⾊."
    fi
fi