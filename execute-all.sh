#!/bin/bash

echo "This will automatically run all scripts in the project"

./scripts/auto-cpufreq-installation.sh
./scripts/powertop-install.sh
./scripts/asus-linux.sh
./scripts/starship/starship-installation.sh
./scripts/apps-installation.sh
./scripts/network-settings.sh
./scripts/font-installation.sh

chmod +x "$0"
