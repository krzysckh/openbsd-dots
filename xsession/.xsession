#!/bin/sh

__wm=dwm

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/plan9/bin:/usr/games:/usr/local/jdk-17/bin:$HOME/go/bin

xrdb .Xresources

setxkbmap pl

export ENV=$HOME/.kshrc
export LANG=pl_PL.UTF-8

# https://www.c0ffee.net/blog/openbsd-on-a-laptop/#networking
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

# openbsd-wallpaper &
xwallpaper --output eDP-1 --maximize /home/kpm/documents/img/wal.jpg
xbanish &

case $__wm in
	cwm)
		bsd_bar $__wm &
		$__wm
		;;
	dwm)
		bsd_bar $__wm &
		$__wm
		;;
esac

ps auxw | grep bsd_bar | awk '{print $2}' | xargs kill -9 

# O---o
