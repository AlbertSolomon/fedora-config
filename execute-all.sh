#!/bin/bash

echo "This will automatically run all scripts in the project"

sudo dnf makecache --refresh

./scripts/auto-cpufreq-installation.sh
./scripts/powertop-install.sh
./scripts/asus-linux.sh
./scripts/starship/starship-installation.sh
./scripts/apps-installation.sh
./scripts/network-settings.sh
./scripts/font-installation.sh
./scripts/babita.sh

echo "Installation complete ✅"

chmod +x "$0"
