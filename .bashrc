# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

#####---------- EXPORTS ----------###

export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="nvim"
export LESSHISTFILE=-
export HISTFILE="$HOME/.bash_history"

eval $(dircolors ~/.dir_colors)

alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias grep='grep --color=auto'
alias neofetch='neofetch --ascii ~/.config/neofetch/arch'

###------------------- PROMPT -----------------------###


PS1="\[\e[1;33m\]\[\033[34m\]\n\[\033[1;90m\] 󰣇 \[\e[1;37m\] \w \[\e[1;37m\]\[\e[0;37m\] "


###-------myvars--------###
export data='/run/media/zeatoen/Files/data'
alias show_battery="cat /sys/class/power_supply/BAT0/capacity"
printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "bash" }}\x9c'
alias trs="gio trash"
