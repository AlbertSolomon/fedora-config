#!/bin/bash

echo "This will automatically run all scripts in the project"

./scripts/auto-cpufreq-installation.sh
./scripts/powertop-install.sh
./scripts/starship/starship-installation.sh

chmod +x "$0"