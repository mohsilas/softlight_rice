#!/bin/bash

if ip link show proton up &> /dev/null; then
	echo ""
else
	echo "󰦞 insec"
fi
