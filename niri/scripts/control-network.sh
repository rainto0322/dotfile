#!/bin/bash


# 扫描并列出可用 Wi-Fi 网络，通过 wofi 选择
selected_network=$(nmcli --fields "SSID,SIGNAL" dev wifi list | awk 'NR>1 {print $1}' | wofi --dmenu --prompt "选择 Wi-Fi 网络:")

if [ -z "$selected_network" ]; then
    echo "未选择网络，退出。"
    exit 0
fi

# 检查是否需要密码
security=$(nmcli -g 802-11-wireless-security.psk dev wifi list | grep -m1 "$selected_network" | awk '{print $2}')
if [ "$security" != "--" ]; then
    password=$(wofi --insensitive --dmenu --password --prompt "输入 Wi-Fi 密码:" --hide-scroll --hide-scroll --no-actions)
    if [ -z "$password" ]; then
        echo "密码未输入，退出。"
        exit 0
    fi
    # 连接带密码的网络
    nmcli dev wifi connect "$selected_network" password "$password"
else
    # 连接开放网络
    nmcli dev wifi connect "$selected_network"
fi

# 检查连接状态
if [ $? -eq 0 ]; then
    echo "成功连接到 $selected_network"
else
    echo "连接失败，请检查网络配置或密码。"
fi
