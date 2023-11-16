#!/bin/bash
if [ -n "$(which cron)"]; then
	echo "cron is already installed "
else
        echo "installing cronie"
	dnf install cronie cronie-anacron
fi
