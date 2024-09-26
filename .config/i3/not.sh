#!/bin/bash

disnot(){
ffplay -nodisp -autoexit ~/.config/dunst/assets/my_battery_getting_low.mp3 &


dunstify  -A "1,default" -u critical -i ~/.config/dunst/assets/bat_low.png "batter low" "plug the charger immediately."  && pkill ffplay


}


while [ "$(upower -i $(upower -e | grep battery) | grep percentage | awk "{print \$2}" | sed "s/%//")" -gt 1  ];
do
	sleep 3

done

disnot

