#!/bin/bash
# Author: Rainto_0322
# Description: Screenshot script

SAVE_DIR="$HOME/Pictures/screenshots"
mkdir -p "$SAVE_DIR"
FILE_NAME="$(date +%Y%m%d_%H%M%S).png"
SAVE_PATH="$SAVE_DIR/$FILE_NAME"

# -b   background color
# -c   border color
# -w   border width
# 2>&1 Avoid script errors caused by user deselection
SELECTION=$(slurp -d -b 00000080 -c c4a7e7 -w 5 2>&1)

# Is slurp running
if pgrep -x "slurp" >/dev/null; then
  exit 1
fi

grim -g "$SELECTION" "$SAVE_PATH"

# unselected area
if [ $? -ne 0 ]; then
  exit 1
fi

wl-copy < "$SAVE_PATH"

notify-send "Screenshot Done" "$FILE_NAME" -i "$SAVE_PATH" -r 9526
