#!/bin/sh

export LANG=en_US.UTF-8
export LC_CTYPE=es_ES.UTF-8

#xcompmgr &
xrdb -merge $HOME/.Xresources &
eval `cat ~/.fehbg` &
setxkbmap es &
urxvtd -q -f -o &
#NOT WORKING??
xmodmap ~/.Xmodmap &

exec spectrwm
