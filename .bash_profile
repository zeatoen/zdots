if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  export PATH=$PATH:/home/zeatoen/.local/share/gem/ruby/3.2.0/bin 
  export EDITOR=nvim
  export VISUAL=nvim
  export GTK_THEME=Tokyonight-Dark
  startx
fi
