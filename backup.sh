#!/bin/bash

# Define source folder array
source_dirs=(
    "~/.config/nvim"
    "~/.config/niri"
    "~/.config/waybar"
    "~/.config/dunst"
    "~/.config/kitty"
    "~/.config/dwm"
    "~/.config/rofi"
    "~/.config/wofi"
    "~/.config/swaylock"
    "~/.config/fcitx5"
    "~/.config/icons"
    "~/.config/zed"
		"~/.local/share/fcitx5/themes/rose-pine"
    "~/.bashrc"
)

# Backup logger
LOG_FILE="$HOME/.local/log/backup.log"
echo '' >> "$LOG_FILE"

# Specify the target folder
target_dir="$HOME/dotfile"
mkdir -p "$target_dir"

# Traverse each item in the array
for item in "${source_dirs[@]}"; do
    # Extend the wavy line (~) to the actual path
    expanded_item=$(eval echo "$item")

    # Check if the project exists
    if [ -e "$expanded_item" ]; then
        echo -e "正在复制: $expanded_item" | tee -a "$LOG_FILE"
        # If it is a directory, recursively copy
        if [ -d "$expanded_item" ]; then
            cp -r "$expanded_item" "$target_dir/"
        else
            cp "$expanded_item" "$target_dir/"
        fi
    else
        echo -e "警告: $expanded_item 不存在，跳过" | tee -a "$LOG_FILE"
    fi
done

echo "所有文件和文件夹已复制到 $target_dir"

git add .
git commit -m "$(date)"
git push --verbose
