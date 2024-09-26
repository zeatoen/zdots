#!/bin/bash

# Options for the rofi menu
options="Lock\nLogout\nReboot\nShutdown"

# Launch the rofi menu and get the chosen option
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Choose action:")

# Take action based on the choice
case "$chosen" in
    Lock)
        # Lock screen (change this command based on your lock screen utility)
        i3lock;;
    Logout)
        # Logout from the current session (adjust the command for your DE/WM)
        i3-msg exit;;
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

