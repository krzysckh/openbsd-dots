
set -o vi

export EDITOR=vim
export VISUAL=vim
export PAGER=less

alias catgirl='catgirl -H 1'
alias gc='git clone'
alias web2plain='w3m -dump -cols 80 -o display_image=false \
  -o display_link_number=true'
alias cleanmeta="exiftool -all:all= -r"
alias predefined="clang -E -dM - < /dev/null"
alias predefined_tcc="tcc -E -dM - < /dev/null"
alias 9fortune="9 fortune $HOME/documents/text/fortunes"

topdf() {
  [ -z "$1" ] && return

  bare="$(echo $1 | rev | sed 's/.*\.//' | rev)"
  tesseract "$1" "$bare" -l pol pdf
  echo "=> $bare"
}

HISTFILE=$HOME/.ksh_history
HISTSIZE=1000000

PS1="$ "

#export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/plan9/bin:/usr/games
