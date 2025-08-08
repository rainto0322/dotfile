#!/bin/bash

# 定义源文件夹数组
source_dirs=(
    "~/.config/nvim"
    "~/.config/hypr"
    "~/.config/waybar"
    "~/.config/dunst"
    "~/.config/kitty"
    "~/.config/kitty"
    "~/.config/dwm"
    "~/.config/rofi"
    "~/backup.sh"
    "~/.bashrc"
)

# 指定目标文件夹
target_dir="$HOME/dotfile"

# 创建目标文件夹（如果不存在）
mkdir -p "$target_dir"

# 遍历数组中的每个项目
for item in "${source_dirs[@]}"; do
    # 扩展波浪线(~)到实际路径
    expanded_item=$(eval echo "$item")
    
    # 检查项目是否存在
    if [ -e "$expanded_item" ]; then
        echo "正在复制: $expanded_item"
        
        # 如果是目录，则递归复制
        if [ -d "$expanded_item" ]; then
            cp -r "$expanded_item" "$target_dir/"
        else
            cp "$expanded_item" "$target_dir/"
        fi
    else
        echo "警告: $expanded_item 不存在，跳过"
    fi
done

echo "所有文件和文件夹已复制到 $target_dir"