#!/bin/bash

# Get the battery percentage (round down to integer if necessary)
battery_percent=$(upower -i $(upower -e | grep battery) | grep -i percentage | awk '{print int($2)}')

# Determine the icon based on the percentage
if [[ $battery_percent -ge 80 ]]; then
    icon=" "
elif [[ $battery_percent -ge 60 ]]; then
    icon=" "
elif [[ $battery_percent -ge 40 ]]; then
    icon=" "
elif [[ $battery_percent -ge 20 ]]; then
    icon=" "
else
    icon=" "
fi

# Check if the battery is charging
charging=$(upower -i $(upower -e | grep battery) | grep -i state | awk '{print $2}')
if [[ $charging == "charging" ]]; then
    icon=" "
fi

# Output the battery percentage with the corresponding icon
echo "$icon$battery_percent%"

