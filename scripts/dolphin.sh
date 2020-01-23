#!/bin/bash

if [ $(pidof dolphin) ]; then
    killall dolphin
else
  i3-msg "workspace number 1" &&
  exec dolphin &
  exec /home/johan/i3lm/layout_manager.sh DOLPHIN
fi
