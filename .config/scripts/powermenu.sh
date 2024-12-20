#!/bin/bash

# Options for the rofi menu
options="Lock\nLogout\nReboot\nShutdown\nSuspend"

# Launch the rofi menu and get the chosen option
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Choose action:")

# Take action based on the choice
case "$chosen" in
  Suspend)
    systemctl suspend
    ;;
    Lock)
        # Lock screen (change this command based on your lock screen utility)
        if [[ $XDG_SESSION_DESKTOP ==  "i3" ]]; then
          i3lock --nofork --line-uses-ring --separator-color=00000000 --ring-color=ffffff --color=23283311 --keyhl-color 191919 --insidever-color eeeeee --ringver-color 000000  --insidewrong-color 232833 --ringwrong-color 111111 --wrong-color eeeeee
        elif [[ $XDG_SESSION_DESKTOP == "Hyprland" ]]; then
          hyprlock
        fi
 ;;
    Logout)
        # Logout from the current session (adjust the command for your DE/WM)
        if [[ $XDG_SESSION_DESKTOP ==  "i3" ]]; then
          i3-msg exit
        elif [[ $XDG_SESSION_DESKTOP == "Hyprland" ]]; then
          hyprctl dispatch exit
        fi
        ;;
    Reboot)
        # Reboot the system
        systemctl reboot;;
    Shutdown)
        # Shutdown the system
        systemctl poweroff;;
    *)
        # If no valid option was chosen, do nothing
        ;;
esac

