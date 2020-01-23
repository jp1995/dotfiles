#!/bin/bash

i3-msg "workspace number 3" &&
exec /home/johan/i3lm/layout_manager.sh RIGHT &
sleep 0.66;
i3-msg "workspace number 1" &&
exec /home/johan/i3lm/layout_manager.sh LEFT &
sleep 0.66;
i3-msg "workspace number 2" &&
exec /home/johan/i3lm/layout_manager.sh MIDDLE
