#!/bin/bash
# this scripts picks a second image to overlay on the background, in this case, a shadow png

PICTURES_FOLDER="/home/username/Pictures/shadows"
OUTPUT_FILE="/home/username/.config/myscripts/sd.txt"

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
