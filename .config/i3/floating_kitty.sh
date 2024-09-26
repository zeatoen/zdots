#!/bin/bash

kitty &
disown "%kitty"
sleep 0.5
i3-msg  "[id=$(xdotool getactivewindow)] floating enable; resize set height 600 px ;resize set width 1000 px ; move position center"
