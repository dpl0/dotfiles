#!/bin/sh

xrdb ~/.Xresources
xmodmap ~/.Xmodmap
#xautolock -time 3 -locker slock

exec spectrwm
#exec mate-session
