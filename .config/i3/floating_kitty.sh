#!/bin/bash

kitty &
id=$!
disown "%kitty"
sleep 0.5
i3-msg  "[id=$(xdotool search --pid $id)] floating enable; resize set height 600 px ;resize set width 1000 px ; move position center"
