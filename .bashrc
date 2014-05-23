# .bashrc

# set bash prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# set z.sh - https://github.com/rupa/z
. $HOME/z/z.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# load aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# make all completions case insensitive
bind 'set completion-ignore-case on'

# we want tmux to use 256 colors
export TERM="screen-256color"

# User specific aliases and functions


# set solarized dircolors
#eval `dircolors dircolors.256dark`
eval `dircolors $HOME/dircolors.ansi-universal`
