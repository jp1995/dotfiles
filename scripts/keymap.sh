#!/bin/bash
currentmap=$(setxkbmap -query | grep layout | cut -c 13-)
if [ $currentmap == "us" ]; then
  setxkbmap ee
  notify-send "keyboard layout: EE"
elif [[ $currentmap == "ee" ]]; then
  setxkbmap us
  notify-send "keyboard layout: US"
fi
