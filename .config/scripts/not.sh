#!/bin/bash

batscr=~/.config/i3blocks/scripts/battery/battery
sound=~/.config/scripts/assets/my_battery_getting_low.mp3 
disnot(){
  mpg123 $sound &
  
  
  dunstify  -A "1,default" -u critical -i ~/.config/dunst/assets/bat_low.png "batter low" "plug the charger immediately."  && pkill mpg123
  

}

while  [ 1 ];
do
  if [ $( $batscr | head -n 1 | sed 's/\([0-9]*\)%.*/\1/p' -n) -le 5 ] && [ $( $batscr | head -n 1 | sed 's/.*% \(.*\)/\1/p' -n) == "DIS"  ]; then
    # kitty bash -c "sleep 1 && cmatrix -L" &
    # id=$!
    # sleep 0.5
    # wid=$(xdotool search --pid $id )
    # i3-msg "[id=$wid] fullscreen enable"
    disnot
    # kill $id

  fi
  sleep 60
done




