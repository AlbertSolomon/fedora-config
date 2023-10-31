#!/bin/bash
if [ -n "$(which cron)"]; then
	echo "cron is already installed "
else
	dnf install cronie cronie-anacron
fi
