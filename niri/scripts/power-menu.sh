#!/usr/bin/env bash

ang
SCRIPT=$HOME/.config/niri/scripts

MENU_ITEMS=(
     "   Monitor off::swaylock && sleep 5 && niri msg action power-off-monitors"
    #"   Monitor off::swaylock && swayidle timeout 5 \"niri msg action power-off-monitors\" && pkill -f swayidle"
    "   Power off::shutdown now"
    "   Reboot::reboot"
    "   Logout::loginctl terminate-user $USER"
    "   Wallpaper::bash $SCRIPT/control-wallpaper.sh"
)

show_menu() {
    local menu_text=$(printf "%s\n" "${MENU_ITEMS[@]}" | awk -F'::' '{print $1}')
    local choice=$(echo "$menu_text" | wofi -l top_right -x -20 -y 10  -W 250 -H 210 -a -d -j -p "Power menu:")
    [[ -z "$choice" ]] && exit 0

    for item in "${MENU_ITEMS[@]}"; do
        if [[ "$item" == "$choice::"* ]]; then
            local cmd="${item#*::}"
            eval "$cmd" || notify-send "Power Menu" "Failed: $choice"
            return
        fi
    done
}

show_menu
