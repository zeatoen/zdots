#!/bin/bash
direc=$1
script_dir=~/.config/scripts
getvol(){

per=$(wpctl get-volume @DEFAULT_AUDIO_SINK@  | awk '{print $2}')

percen=$(echo "scale=0;100*$per/1" | bc  )

}
checkmute(){
  m=$(wpctl get-volume @DEFAULT_AUDIO_SINK@  | awk '{print $3}'  )
  [[ -z $m ]] && icon=$script_dir/assets/nmute.png || icon=$script_dir/assets/mute.png
}


duns(){
  getvol
  checkmute
  dunstify -r 555 -I $icon "Volume $percen%" -h int:value:$percen

}

getvol
if [[ -z $direc ]]; then
  wpctl set-mute @DEFAULT_AUDIO_SINK@  toggle
  duns
  exit
fi

if [ $percen -le 100 ]; then
  [[ "-" == $direc || $percen -lt 100  ]] && wpctl set-volume @DEFAULT_AUDIO_SINK@  "0.05$direc"
  duns  
else
  wpctl set-volume @DEFAULT_AUDIO_SINK@  1 
  duns
fi


