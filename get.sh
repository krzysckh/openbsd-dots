#!/bin/sh

AYUP() {
	echo "don't run, if you're not me >:((("
	exit 1
}

mkcopy() {
	mkdir -p "$1"

	cp "$2" "$1/"
}

[ $USER = 'kpm' ] || AYUP

mkcopy Xresources ~/.Xresources
mkcopy vi ~/.exrc
mkcopy ksh ~/.kshrc
mkcopy profile ~/.profile
mkcopy vim ~/.vimrc
mkcopy vim ~/.vim/coc-settings.json
mkcopy xsession ~/.xsession
mkcopy gtk2 ~/.gtkrc-2.0
mkcopy gtk3 ~/.config/gtk-3.0/settings.ini
