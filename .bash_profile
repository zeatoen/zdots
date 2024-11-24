if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  export PATH=$PATH:/home/zeatoen/.local/share/gem/ruby/3.2.0/bin 
  x=`echo -e "Hyprland\nstartx" |fzf --layout=reverse`
  if [[ $x == "Hyprland" ]]; then
    Hyprland 2>&1 | >/dev/null
  elif [[ $x == "startx" ]]; then
    startx 2>&1 | >/dev/null
  fi

fi
