#!/bin/bash
swayidle -w \
timeout 120 ' swaylock ' \
timeout 150 ' hyprctl dispatch dpms off' \
timeout 150 'systemctl suspend' \
resume ' hyprctl dispatch dpms on' \



