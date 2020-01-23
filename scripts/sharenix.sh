#!/bin/bash

sharenix-section -upload=false
i3-msg "workspace number 1" &&
exec dolphin /home/johan/sharenix/archive &
exec /home/johan/i3lm/layout_manager.sh DOLPHIN
