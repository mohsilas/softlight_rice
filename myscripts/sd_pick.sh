#!/bin/bash

PICTURES_FOLDER="/home/heartmachine/Pictures/shadows"
OUTPUT_FILE="/home/heartmachine/.config/myscripts/sd.txt"

if [ ! -d "$PICTURES_FOLDER" ]; then
  exit 1
fi

FILES=($(find "$PICTURES_FOLDER" -maxdepth 1 -type f))

if [ ${#FILES[@]} -eq 0 ]; then
  exit 1
fi

RANDOM_INDEX=$(( RANDOM % ${#FILES[@]} ))

SELECTED_PICTURE="${FILES[$RANDOM_INDEX]}"

echo "$SELECTED_PICTURE" > "$OUTPUT_FILE"
