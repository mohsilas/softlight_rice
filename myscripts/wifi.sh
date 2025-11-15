#!/bin/bash
WIFI=$(iwgetid -r)

if [ -z "$WIFI" ]; then
	echo "󰲜"
else
	echo "󰱓"
fi
