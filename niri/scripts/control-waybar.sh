#!/bin/bash
# Author: Rainto_0322
# Description: Script for toggle wayabr
#
pgrep -x "waybar" >/dev/null && killall waybar || waybar
