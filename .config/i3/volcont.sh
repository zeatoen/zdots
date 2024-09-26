#!/bin/bash
direc=$1
getvol(){

per=$(wpctl get-volume 50 | awk '{print $2}')

percen=$(echo "scale=0;100*$per/1" | bc  )

}
checkmute(){
  m=$(wpctl get-volume 50 | awk '{print $3}'  )
  [[ -z $m ]] && icon=~/.config/i3/nmute.png || icon=~/.config/i3/mute.png
}


duns(){
  getvol
  checkmute
  dunstify -r 555 -I $icon "Volume $percen%" -h int:value:$percen

}

getvol
if [[ -z $direc ]]; then
  wpctl set-mute 50 toggle
  duns
  exit
fi

if [ $percen -le 100 ]; then
  [[ "-" == $direc || $percen -lt 100  ]] && wpctl set-volume 50 "0.05$direc"
  duns  
else
  wpctl set-volume 50 1 
  duns
fi


