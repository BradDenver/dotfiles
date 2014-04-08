alias v="vim"

alias l='ls -Al'

alias ..='cd ../'

# on CentOS you need to alias cmake to cmake28
CMAKE=/bin/false
if [ "`cmake --version | cut -d" " -f3 | cut -c1-3`" = "2.8" ]
then 
  CMAKE="/usr/bin/cmake"
else 
  if [ -f /usr/bin/cmake28 ]
  then
    CMAKE="/usr/bin/cmake28"
  fi
fi
alias cmake="$CMAKE"

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
