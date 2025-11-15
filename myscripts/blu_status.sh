#!/bin/bash
dev=$(bluetoothctl devices | cut -f2 -d' ' | while read -r mac; do bluetoothctl info "$mac" | grep -E "Name:|Connected: yes"; done | grep -B1 "Connected: yes" | grep "Name:" | cut -d':' -f2- | sed 's/^ *//' | cut -d ' ' -f1)

if [ -n "$dev" ]; then
  dev=" $dev"
fi

if bluetoothctl show | grep -q "Powered: yes"; then 
	echo "$dev"
else
	echo "󰂲"
fi
