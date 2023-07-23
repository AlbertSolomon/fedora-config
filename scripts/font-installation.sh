#!/bin/bash

echo " Installing Nerd fonts 🚀"

echo "Installing font Manager 🚀"
flatpak install flathub org.gnome.FontManager

echo "Installing font Dowloader 🚀"
flatpak install flathub org.gustavoperedo.FontDownloader

#lets check if a directory exists
FONT_DIR = "$(~/.local/share/fonts/ -d)"
if [ ! -d "$FONT_DIR" ]; then
	mkdir -p ~/.local/share/fonts
else
	cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
	# cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/JetBrainsMono-Regular.otf
fi

chmod +x "$0"
