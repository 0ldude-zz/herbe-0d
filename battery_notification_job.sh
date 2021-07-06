#!/bin/sh

# This gets the current state string cutting out "state:	"
bat_state="$(upower -i `upower -e | grep 'BAT1'` | grep -E state | awk '{print $2}')"

# This gets the integer percentage of current battery capacity cutting out '%'
percent="$(upower -i `upower -e | grep 'BAT1'` | grep 'percentage' | awk '{print $2}' | tr -d '%')"

#if (pc is charging AND battery > 99%) -> notify
[ $bat_state = 'charging' ] && [ $percent -gt 99 ] && herbe "Unplug me Please," " " "I am too FULL"

# if (pc isn't charging AND battery < 15%) -> notify
[ $bat_state = 'discharging' ] && [ "$percent" -le 15 ] && herbe "Charge me Please," " " "Gonna SHUTDOWN"
