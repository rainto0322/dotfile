#!/usr/bin/env bash

# 设置音乐播放器名称 (支持多个播放器检测)
PLAYER="musicfox"

case $1 in
toggle)
  playerctl -p $PLAYER play-pause
  ;;
next)
  playerctl -p $PLAYER next
  ;;
prev)
  playerctl -p $PLAYER previous
  ;;
*)
  # 获取播放器状态
  if playerctl -p $PLAYER status >/dev/null 2>&1; then
    STATUS=$(playerctl -p $PLAYER status)
    ARTIST=$(playerctl -p $PLAYER metadata artist)
    TITLE=$(playerctl -p $PLAYER metadata title)

    # 缩短超长标题
    if [ ${#TITLE} -gt 30 ]; then
      TITLE="${TITLE:0:28}.."
    fi

    # 根据状态设置图标和显示
    if [[ "$STATUS" == "Playing" ]]; then
      ICON="" # Font Awesome 播放图标
      CLASS="playing"
    else
      ICON="" # Font Awesome 暂停图标
      CLASS="paused"
    fi

    # 输出JSON格式数据
    echo "{\"text\": \"$ICON $ARTIST - $TITLE\", \"class\": \"$CLASS\"}"
  else
    # 播放器未运行
    echo "{\"text\": \" MusicFox 未运行\", \"class\": \"stopped\"}"
  fi
  ;;
esac
