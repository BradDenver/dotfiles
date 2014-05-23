# .bash_profile

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

export PATH

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


