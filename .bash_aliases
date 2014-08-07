alias v="vim"

alias l='ls -Al'

alias ..='cd ../'

# force tmux to use the $TERM env var 
# which is set in .bashrc
alias tmux="tmux -2"


# FUNCTIONS

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# browse style cd
function c() {
  while true
  do
    clear
    echo "pwd: $PWD"
    ls -ACFG
    read -e -p "cd into > " answer
    case "$answer" in
      q) break;;
      *) cd $answer;;
    esac
  done
}

# http://tilvim.com/2013/05/02/g-function.html
function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}


function s {
  if [[ $# > 0 ]]; then
    svn $@
  else
    svn status
  fi
}

alias codecept="./vendor/bin/codecept"
