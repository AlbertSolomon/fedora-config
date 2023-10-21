#!/bin/bash

echo " Installing Nerd fonts 🚀"
CURDIR=pwd

echo "Installing font Manager 🚀"
flatpak install flathub org.gnome.FontManager

echo "Installing font Dowloader 🚀"
flatpak install flathub org.gustavoperedo.FontDownloader

#lets check if a directory exists
FDIR= "~/.local/share/fonts/"
if [ ! -d "${FDIR}" ]; then
	mkdir -p "${FDIR}"
fi
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
# cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/JetBrainsMono-Regular.otf

while read FONT; do
	# cd $FONT
	echo "downloading ${FONT} Nerd font"
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$FONT.tar.xz
	echo "${FONT} Nerd font downloaded succefully..."
	echo "Installing ${FONT} Nerd font...."
	tar -xf $FONT.tar.xz && mv ./*.ttf ./ && rm -r README.md readme.md COPYING-LICENSE $FONT.tar.xz
	echo "${FONT} Nerd font Installed..."

	cd $CURDIR
done < fonts.txt
#fi

# chmod +x "$0"
