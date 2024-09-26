#!/bin/bash

# Function to get current time
get_time() {
    echo -e "$(date +'%H:%M')"  # Red
}

# Function to get battery percentage
get_battery() {
    if [[ $(cat /sys/class/power_supply/BAT0/status) == "Charging" ]]; then
        echo -e "\033[34m$(cat /sys/class/power_supply/BAT0/capacity)% ⚡\033[0m"  # Blue
    else
        echo -e "\033[34m$(cat /sys/class/power_supply/BAT0/capacity)%\033[0m"  # Blue
    fi
}

# Function to get RAM usage
get_ram() {
    local ram_used=$(free -h | awk '/^Mem:/ {print $3}')
    local ram_total=$(free -h | awk '/^Mem:/ {print $2}')
    echo -e "\033[90m${ram_used}/${ram_total}\033[0m"  # Gray
}

# Main loop
while true; do
    printf "\r%s | %s | %s" "$(get_time)"  "$(get_battery)"  "$(get_ram)"
    sleep 5  # Update every 5 seconds
done

