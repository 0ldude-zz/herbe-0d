#!/bin/bash

bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

# This gets the integer percentage of current battery capacity
p=$(eval $bat | grep 'percentage' | awk '{print $2}' | awk -F '.' '{print $1}')

if upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "state"=="charging"; then 
	# if bat > 99% -> notify
	if [ "$p" -gt 99 ] ; then
		echo herbe "Unplug me Please, I'm FULL!!!"
	fi

else
	# if bat < 15% -> notify
	if [ "$p" -le 15 ] ; then
		echo herbe "Charge me Please, I'm gonna SHUTDOWN!!!"
	fi

fi
