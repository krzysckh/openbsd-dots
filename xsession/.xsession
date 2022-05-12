#!/bin/sh

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/plan9/bin:/usr/games

xrdb .Xresources

setxkbmap pl

export ENV=$HOME/.kshrc
export LANG=pl_PL.UTF-8

# https://www.c0ffee.net/blog/openbsd-on-a-laptop/#networking
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

openbsd-wallpaper &
bsd_bar &
xbanish &

cwm
# mlvwm
