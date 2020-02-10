#!/bin/bash

pac=$(checkupdates | wc -l)
aur=$(yay -u | wc -l)

check=$(($pac + $aur))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#25232A}%{F-} $aur"
else
	echo "%{F#25232A}%{F-} No updates!"
fi
