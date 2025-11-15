#!/bin/bash

DEVICE_MAC="E8:EE:CC:FA:A4:E0"

# Get the info for the specified device
INFO_OUTPUT=$(bluetoothctl info "$DEVICE_MAC" 2>/dev/null)

if [ -z "$INFO_OUTPUT" ]; then
    exit 1
fi

# Extract battery percentage
BATTERY_PERCENTAGE=$(echo "$INFO_OUTPUT" | grep "Battery Percentage:" | awk '{print $4}' | tr -d '()')

# Check if battery percentage is found
if [ -n "$BATTERY_PERCENTAGE" ]; then
    echo "󱡏 $BATTERY_PERCENTAGE"
fi

