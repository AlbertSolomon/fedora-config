#!/bin/bash
echo "Installing bibata icon theme"
GREEN="\e[32m"
sudo dnf copr enable peterwu/rendezvous
sudo dnf install bibata-cursor-themes
echo -e "${GREEN} [OK!] Installation complete..."
echo -e "${GREEN} ########################################################################################\n
\n
                    NOTE:\n
                    use gnome tweeks to select this the cursor theme\n
\n
##########################################################################################"

# manual installation [https://github.com/ful1e5/Bibata_Cursor]
# tar -xvf Bibata.tar.gz                # extract `Bibata.tar.gz`
# mv Bibata-* ~/.icons/                 # Install to local users
# sudo mv Bibata-* /usr/share/icons/    # Install to all users