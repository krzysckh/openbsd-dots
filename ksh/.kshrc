set -o vi
stty erase "^?"

export EDITOR=vim
export VISUAL=vim
export PAGER=less
export SUDO=doas # for chicken-install

alias gg='gvim . & exit'
alias chicken-install="chicken-install -s"
alias catgirl='catgirl -H 1'
alias gc='git clone'
alias web2plain='w3m -dump -cols 80 -o display_image=false \
  -o display_link_number=true'
alias cleanmeta="exiftool -all:all= -r"
alias predefined="clang -E -dM - < /dev/null"
alias predefined_tcc="tcc -E -dM - < /dev/null"
alias 9fortune="9 fortune $HOME/documents/text/fortunes"
alias a='ssh kpm@100.64.3.3'
alias dt="Xephyr -fullscreen :1 & (sleep 1 ; DISPLAY=:1
drawterm -g 1366x768 -a 10.0.2.2 -h 10.0.2.2 -u kpm)"
alias pm="doas make clean && perl Makefile.PL && make && doas make install"
alias pstree="pstree -g3"
alias mpvp="mpv --playlist=-"
alias lg="lazygit"
alias d="doas"
alias pl="pkglocate"
alias pa="d pkg_add"
alias xrev="xcalib -invert -alter"
alias gotop="gotop -c default-dark"
alias astyle="astyle --style=mozilla --indent=spaces=2 -xB -xj"
alias mp="mosh --ssh 'ssh -i .ssh/krzysckh.org' root@pub.krzysckh.org"

piq() {
  [ -z "$1" ] && return

  pkglocate $1 | cut -f1 -d: | sort | uniq
}

pi() {
  [ -z "$1" ] && return

  for i in /usr/ports/*/$1/pkg/DESCR; do
    progname=`echo $i | sed -E 's?/usr/ports/.*/(.*)/pkg/DESCR?\1?'`
    echo $progname
    yes "=" | head -n `echo -n $progname | wc -c` | tr -d '\n'
    printf "\n\n"
    cat "$i"
    printf "\n\n"
  done
}

topdf() {
  [ -z "$1" ] && return

  bare="$(echo $1 | rev | sed 's/.*\.//' | rev)"
  tesseract "$1" "$bare" -l pol pdf
  echo "=> $bare"
}

HISTFILE=$HOME/.ksh_history
HISTSIZE=100000000

PS1="λ "

#export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/plan9/bin:/usr/games
