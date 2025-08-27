#!/bin/bash
# Author: Rainto_0322
# Description: The packages that my archlinux environment depends on

LOG_FILE="$HOME/.local/log/arch-install.log"
echo '' >> "$LOG_FILE"

PACKAGES=(
    "git"
    "wofi"            # launcher for wlroots
    "slurp"           # selection box
    "hyprpicker"      # color picker
    "grim"            # screenshot
    "wl-clipboard"    # clipboard for wayland
    "wf-recorder"     # recording for wayland

    "niri"            # My window manager
    "swaylock"        # Screen locker for Wayland
    "swayidle"        # Idle management daemon for Wayland
    "waybar"          # status bar
    "kitty"           # terminal emulator
    "neovim"          # terminal editor
    "helix"           # terminal editor
    "zed"             # z code editor
    "thunar"          # file manager
    "gvfs"            # Identify USB
    "mpv"             # video player

    "nwg-look"                  # GTK setting
    "breeze-gtk"                # dark theme
    "papirus-icon-theme"        # icon theme
    "fcitx5-chinese-addons"     # Addons related to Chinese,
    "noto-fonts-emoji"          # fcitx5 emoji suport
    "ttf-jetbrains-mono-nerd"   # nerd font
    "xwayland-satellite"        # xwayland environment for niri

    # "fcitx5-im"                 # group pulls the main fcitx5 package
    "fcitx5"
    "fcitx5-configtool"
    "fcitx5-gtk"
    "fcitx5-qt"

)

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RESET='\033[0m'

echo -e "${BLUE}===== Arch Linux 专属安装开始 [$(date +'%Y-%m-%d %H:%M:%S')] =====${RESET}" | tee -a "$LOG_FILE"

install_packages() {
    if ! sudo pacman -Sy --noconfirm | tee -a "$LOG_FILE"; then
        echo -e "${YELLOW}[WARN] 数据库更新失败，继续尝试安装...${RESET}" | tee -a "$LOG_FILE"
    fi

for pkg in "${PACKAGES[@]}"; do
    for ((i=1; i<=3; i++)); do
        if sudo pacman -S --noconfirm "$pkg" | tee -a "$LOG_FILE"; then
            echo -e "${GREEN}[OK] $pkg 安装成功${RESET}" | tee -a "$LOG_FILE"
            break
        else
          # peimission
            if [[ $? -eq 1 ]] && grep -q "Permission denied" "$LOG_FILE"; then
                echo -e "${RED}[ERROR] 需要 root 权限！请使用: ${YELLOW}sudo ./script.sh${RESET}" | tee -a "$LOG_FILE"
                exit 1
            fi

            echo -e "${YELLOW}[RETRY] 第 $i 次重试安装 $pkg...${RESET}" | tee -a "$LOG_FILE"
            sleep 2

            if [[ $i -eq 3 ]]; then
                echo -e "${RED}[FAIL] $pkg 安装失败，请检查: ${YELLOW}pacman -Si $pkg${RESET}" | tee -a "$LOG_FILE"
                exit 1
            fi
        fi
    done
done
}

install_packages

echo -e "${BLUE}----- 已安装包状态 -----${RESET}" | tee -a "$LOG_FILE"
for pkg in "${PACKAGES[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        echo -e "${GREEN}[PASS] $pkg 已安装${RESET}" | tee -a "$LOG_FILE"
    else
        echo -e "${RED}[FAIL] $pkg 未安装！${RESET}" | tee -a "$LOG_FILE"
    fi
done

echo -e "${BLUE}===== 安装结束 [$(date +'%Y-%m-%d %H:%M:%S')] =====${RESET}" | tee -a "$LOG_FILE"
