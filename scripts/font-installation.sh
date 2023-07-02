#!/bin/bash

echo " Installing Nerd fonts 🚀"

echo "Installing font Manager 🚀"
flatpak install flathub org.gnome.FontManager

echo "Installing font Dowloader 🚀"
flatpak install flathub org.gustavoperedo.FontDownloader

chmod +x "$0"
