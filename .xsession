#!/bin/sh

#xcompmgr &
xrdb -merge $HOME/.Xresources &
eval `cat ~/.fehbg` &
setxkbmap es &
urxvtd -q -f -o &
#NOT WORKING??
xmodmap ~/.Xmodmap &

exec spectrwm
