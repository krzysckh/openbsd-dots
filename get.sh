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
mkcopy cwmrc ~/.cwmrc
mkcopy vi ~/.exrc
mkcopy ksh ~/.kshrc
mkcopy profile ~/.profile
mkcopy vim ~/.vimrc
mkcopy xsession ~/.xsession
mkcopy res ~/res/sus_bw.vim


