#!/bin/bash
# Author: Rainto_0322
# Description: Script for random wallpaper

BASE_DIR=~/.config/niri/wallpapers
SWWW_TRANSITION="--transition-type grow --transition-step 50"

if [ ! -d "$BASE_DIR" ]; then
    notify-send "Wallpaper directory does not exist" "Please check $BASE_DIR"
    exit 1
fi

wallpapers=($(find "$BASE_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \)))

if [ ${#wallpapers[@]} -eq 0 ]; then
    notify-send "Wallpaper not found"
    exit 1
fi

random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

swww img "$random_wallpaper" $SWWW_TRANSITION
notify-send "Wallpaper Switched" "$(basename "$random_wallpaper")" -i "$random_wallpaper" -r 6666
