#!/bin/bash

bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

# This gets the integer percentage of current battery capacity
p=$(eval $bat | grep 'percentage' | awk '{print $2}' | awk -F '.' '{print $1}')

bat_h='herbe "Unplug me Please," " " "I am too FULL"'
bat_l='herbe "Charge me Please," " " "Gonna SHUTDOWN"'

if upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "state"=="charging"; then 
	# if bat > 99% -> notify
	if [ "$p" -gt 99 ] ; then
		eval $bat_h
	fi

else
	# if bat < 15% -> notify
	if [ "$p" -le 15 ] ; then
		eval $bat_l
	fi

fi
