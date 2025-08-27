#!/bin/bash

# Base wallpaper directory
BASE_DIR=~/.config/niri/wallpapers

# Recursive thumbnail selector using rofi
prompt_selection() {
    local current_dir="$1"

    # Generate the list with icon metadata
    local selection=$(find "$current_dir" -maxdepth 1 -mindepth 1 | sort | while read -r item; do
        local name="$(basename "$item")"
        if [ -d "$item" ]; then
            printf "%s\0icon\x1f%s\n" "$name" "$HOME/.local/share/icons/folder.svg"
        elif [ -f "$item" ]; then
            printf "%s\0icon\x1f%s\n" "$name" "$item"
        fi
    done | rofi -dmenu -show-icons -p "Select Wallpaper")

    # Exit if nothing selected
    [ -z "$selection" ] && return

    # Strip trailing slash (folder name)
    local item_name="${selection%/}"
    local full_path="$current_dir/$item_name"

    # Directory? Recurse. File? Set wallpaper.
    if [ -d "$full_path" ]; then
        prompt_selection "$full_path"
    elif [ -f "$full_path" ]; then
        walset "$full_path"
    fi
}

prompt_selection "$BASE_DIR"
