#!/bin/bash

if pgrep "rclone" > /dev/null; then
	echo "󰅟"
else
	echo "󰴀"
fi
