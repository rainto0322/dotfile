#!/bin/bash
# Author: Rainto_0322
# Description: Script for switching screen recording

OUTPUT_DIR="$HOME/Videos/recording"
mkdir -p "$OUTPUT_DIR"
FILE_NAME=$(date +%Y-%m-%d-%H%M%S).mkv
ICON_START="$HOME/.config/icons/record-start.svg"
ICON_END="$HOME/.config/icons/record-end.svg"
OUTPUT_FILE="$OUTPUT_DIR/$FILE_NAME"

# wf-recorder
if pgrep -x "wf-recorder" >/dev/null; then
  pkill -x wf-recorder
  notify-send "Done $FILE_NAME" -i "$ICON_END" -r 9527
else
  wf-recorder -f "$OUTPUT_FILE" -p preset pultrafast --audio &
  notify-send "Start recording ..." -i "$ICON_START" -r 9527
fi
