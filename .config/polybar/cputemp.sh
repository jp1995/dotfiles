#!/bin/bash


tempGPU=$(sensors | grep -i edge: | head -n1 | sed -r 's/.*:\s+[\+-]?(.*C)\s+.*/\1/')
temp=$(sensors | grep -i AUXTIN0 | head -n1 | sed -r 's/.*:\s+[\+-]?(.*C)\s+.*/\1/')
#fan=$(sensors | grep -i fan1 | head -n1 | sed -r 's/.*:\s+[\+-]?(.*RPM)\s+.*/\1/')

printf " CPU: $temp / GPU: $tempGPU $fan"
