#!/bin/bash

#-----------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------

# Notice title
notice() { echo  "\033[1;32m=> $1\033[0m"; }

# Error title
error() { echo "\033[1;31m=> Error: $1\033[0m"; }

# List item
c_list() { echo  "  \033[1;32m✔\033[0m $1"; }

# Error list item
e_list() { echo  "  \033[1;31m✖\033[0m $1"; }

# Check for dependency
dep() {
  type -p $1 &> /dev/null
  local installed=$?
  if [ $installed -eq 0 ]; then
    c_list $1
  else
    e_list $1
  fi
  return $installed
}

backup() {
  mkdir -p $backupdir

  local files=( $(ls -a) )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}" || cp -Rf "$HOME/$file" "$backupdir/$file"
  done
}

install() {
  local files=( $(ls -a) )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}"
    should_install=$?
    if [ $should_install -gt 0 ]; then
      [ -d "$HOME/$file" ] && rm -rf "$HOME/$file"
      cp -Rf "$file" "$HOME/$file"
    fi
  done
}

in_array() {
  local hay needle=$1
  shift
  for hay; do
    [[ $hay == $needle ]] && return 0
  done
  return 1
}


#-----------------------------------------------------------------------------
# Initialize
#-----------------------------------------------------------------------------

backupdir="$HOME/.dotfiles-backup/$(date "+%Y%m%d%H%M.%S")"
dependencies=(git vim)
# .vim is excluded so that swp files, vundle etc are not lost
excluded=(. .. .git .gitignore .gitmodules bootstrap.sh Gemfile Gemfile.lock Rakefile README.md .vim)


#-----------------------------------------------------------------------------
# Dependencies
#-----------------------------------------------------------------------------

notice "Checking dependencies"

not_met=0
for need in "${dependencies[@]}"; do
  dep $need
  met=$?
  not_met=$(echo "$not_met + $met" | bc)
done

if [ $not_met -gt 0 ]; then
  error "$not_met dependencies not met!"
  exit 1
fi


#-----------------------------------------------------------------------------
# Install
#-----------------------------------------------------------------------------

# Assumes $HOME/dotfiles is *ours*
if [ -d $HOME/dotfiles ]; then
  pushd $HOME/dotfiles

  # Update Repo
  notice "Updating"
  git pull origin master
  git submodule init
  git submodule update

  # Backup
  notice "Backup up old files ($backupdir)"
  backup

  # Install
  notice "Installing"
  install
else
  # Clone Repo
  notice "Downloading"
  git clone --recursive https://github.com/BradDenver/dotfiles.git $HOME/dotfiles

  pushd $HOME/dotfiles

  # Backup
  notice "Backup up old files ($backupdir)"
  backup

  # Install
  notice "Installing"
  install
fi

# ensure we have the required .vim dirs as they are not copied from repo
mkdir -p $HOME/.vim/tmp
mkdir -p $HOME/.vim/bundle
notice "vim folders created (if not present already)"

# install vundle if not already there
if [ ! -d $HOME/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
  notice "made $HOME/.vim/bundle/vundle and cloned vundle"
fi

# install plugins via vundle
vim +PluginInstall +qall
notice "vim plugins installed via vundle"


#-----------------------------------------------------------------------------
# Finished
#-----------------------------------------------------------------------------

popd
notice "Done"
exec $SHELL -l
