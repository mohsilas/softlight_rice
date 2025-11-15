#!/bin/bash

# Get the used memory in GB (rounded)
used_mem=$(free -b | awk '/Mem/ {print int($3/1024/1024/1024 + 0.5)}')

# Define the icons for each memory usage level
icons=("(..◜ᴗ◝..)" "(≖ ‿ ≖)" "( •̀⤙•́ )" "(˶˃⤙˂˶)" "ᕙ( ᗒᗣᗕ )ᕗ" "(╯'□')╯ ┻━┻" "╭∩╮( •̀_•́ )╭∩╮" "(×_×)" )

# Assign the icon based on used memory
if [ "$used_mem" -le 1 ]; then
    icon="${icons[0]}"
elif [ "$used_mem" -le 2 ]; then 
    icon="${icons[1]}"
elif [ "$used_mem" -le 3 ]; then
    icon="${icons[2]}"
elif [ "$used_mem" -le 4 ]; then
    icon="${icons[3]}"
elif [ "$used_mem" -le 5 ]; then
    icon="${icons[4]}"
elif [ "$used_mem" -le 6 ]; then
    icon="${icons[5]}"
elif [ "$used_mem" -le 7 ]; then
    icon="${icons[6]}"
else
    icon="${icons[7]}"
fi

# Echo the result
echo "$icon"

