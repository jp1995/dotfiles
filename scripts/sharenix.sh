#!/bin/bash

import png:- | xclip -selection clipboard -t image/png
sleep 1
xclip -selection clipboard -o > /home/johan/Pictures/screenshots/`date +%Y-%m-%d_%T`.png
