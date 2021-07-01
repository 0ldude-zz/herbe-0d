#!/bin/bash

# This gets the current state string cutting out "state:	"
bat_state="$(upower -i `upower -e | grep 'BAT1'` | grep -E state | awk '{print $2}')"

# This gets the integer percentage of current battery capacity cutting out '%'
percent="$(upower -i `upower -e | grep 'BAT1'` | grep 'percentage' | awk '{print $2}' | cut -c -2)"

bat_h='herbe "Unplug me Please," " " "I am too FULL"'
bat_l='herbe "Charge me Please," " " "Gonna SHUTDOWN"'

if [ 'charging' = '$bat_state' ]; then 
	# if bat > 99% -> notify
	if [[ "$percent" -gt 15 ]]; then
		eval $bat_h
	fi

else
	# if bat < 15% -> notify
	if [[ "$percent" -le 15 ]]; then
		eval $bat_l
	fi

fi
