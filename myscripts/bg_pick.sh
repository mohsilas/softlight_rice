#!/bin/bash

PICTURES_FOLDER="/home/username/Pictures/colors"
OUTPUT_FILE="/home/username/.config/myscripts/bg.txt"

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
