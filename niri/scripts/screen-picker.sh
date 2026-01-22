#!/bin/bash
# Author: Rainto_0322
# Description: Screen color picker script with formatted notification

# check hyprpicker
if pgrep -x "hyprpicker" >/dev/null; then
  exit 1
fi

# fotmat color
COLOR=$(hyprpicker | tr -d '\n')

# clipboard
echo -n "$COLOR" | wl-copy

# Create a temporary file for color preview
PREVIEW_FILE="/tmp/picker_preview.png"
convert -size 55x55 xc:"$COLOR" "$PREVIEW_FILE"

notify-send "Color Picked" "Hex: $COLOR" -i "$PREVIEW_FILE" -r 9527

rm "$PREVIEW_FILE"
