#!/bin/bash
# Author: Rainto_0322
# Description: Script for Volume Control

MAX_VOLUME=1.5
DEFAULT_SINK="@DEFAULT_AUDIO_SINK@"
VOLUME_FILE="/tmp/previous_volume"
VOLUME_ICON="$HOME/.config/icons/volume.svg"
VOLUME_MUTED_ICON="$HOME/.config/icons/volume-muted.svg"

# Get the current volume percentage and mute status
read current_volume is_muted <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2, ($3 == "[MUTED]" ? "MUTED" : "UNMUTED")}')

case "$1" in
    "+")
        new_volume=$(awk -v vol="$current_volume" 'BEGIN {printf "%.2f", vol + 0.05}')
        ;;
    "-")
        new_volume=$(awk -v vol="$current_volume" 'BEGIN {printf "%.2f", vol - 0.05}')
        ;;
    *)
        if [[ $is_muted == "MUTED" ]]; then
            # Get historical volume
            new_volume=$(awk 'NR==1{print $1}' "$VOLUME_FILE" 2>/dev/null || echo "0.5")
        else
            # Store the current volume
            echo "$current_volume" > "$VOLUME_FILE"
            wpctl set-mute "$DEFAULT_SINK" toggle
            notify-send "Volume: [muted]" -r 9527 -i "$VOLUME_MUTED_ICON"
            exit 0
        fi
        ;;
esac

# Limit the maximum and minimum values
new_volume=$(awk -v vol="$new_volume" -v max="$MAX_VOLUME" 'BEGIN {
    printf "%.2f",
    (vol > max) ? max : (vol < 0) ? 0 : vol
}')

# Control volume
wpctl set-volume "$DEFAULT_SINK" "$new_volume"
wpctl set-mute "$DEFAULT_SINK" 0

# Display notifications (percentage)
volume_percent=$(awk -v vol="$new_volume" 'BEGIN {printf "%.0f%%", vol * 100}')
notify-send "Volume: $volume_percent" -r 9527 -i "$VOLUME_ICON"
