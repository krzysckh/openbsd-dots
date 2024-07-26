#!/bin/sh

ulimit -Sd `ulimit -Hd`

# export _WALLPAPER=kirby-1.jpg
# export WALLPAPER=$HOME/documents/img/bg/$_WALLPAPER
export QT_FONT_DPI=96
export QT_QPA_PLATFORMTHEME=qt5ct
__wm=dwm
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/plan9/bin:/usr/games:/usr/local/jdk-17/bin:$HOME/go/bin:$HOME/.cargo/bin:/usr/local/games/:$HOME/.local/share/racket/8.10/bin/:/usr/local/share/ipl/bin

xrdb .Xresources

setxkbmap pl,apl -option grp:rctrl_switch

eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
export PLAN9=/usr/local/plan9
export ENV=$HOME/.kshrc
export LANG=pl_PL.UTF-8

# https://www.c0ffee.net/blog/openbsd-on-a-laptop
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

#openbsd-wallpaper &
#xwallpaper --zoom $WALLPAPER
9 fortune ~/nmojeprogramy/plan9front/lib/theo \
  | cowsay \
  | samelines.pl \
  | convert -size 1366x768 -gravity center -background "#2b3339" \
  -fill "#a7c080" -pointsize 13 \
  -font 'Lilex-Regular' label:@- /tmp/wall.png
xwallpaper --maximize /tmp/wall.png

xbanish &
dunst &
redshift -l 50:20 &
urxvtd -q -o -f

export AUTOMAKE_VERSION=1.16
export AUTOCONF_VERSION=2.69

xclickroot -r show-pmenu &
xclickroot -m urxvtc &

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
