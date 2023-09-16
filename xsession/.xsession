#!/bin/sh

ulimit -Sd `ulimit -Hd`

export QT_FONT_DPI=96
export QT_QPA_PLATFORMTHEME=qt5ct
__wm=dwm
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/plan9/bin:/usr/games:/usr/local/jdk-17/bin:$HOME/go/bin:$HOME/.cargo/bin:/usr/local/games/

xrdb .Xresources

setxkbmap pl

export PLAN9=/usr/local/plan9
export ENV=$HOME/.kshrc
export LANG=pl_PL.UTF-8

# https://www.c0ffee.net/blog/openbsd-on-a-laptop
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

openbsd-wallpaper &
xbanish &
dunst &
redshift -l 50:20 &
urxvtd -q -o -f

export AUTOMAKE_VERSION=1.16
export AUTOCONF_VERSION=2.69

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
