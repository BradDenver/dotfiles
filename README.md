dotfiles
========

My dotfiles with inspiration from https://github.com/gf3/dotfiles, https://github.com/mathiasbynens/dotfiles, https://github.com/paulirish/dotfiles & https://gist.github.com/iammerrick/8245832

## Dependencies
* bc (I had to install via `sudo yum install bc` on my CentOS 6.5 devbox)
* Git
* Vim

## Bootstrapper
My bootstrap.sh script is based on [Gianni Chiappettas](https://github.com/gf3/dotfiles) excellent setup. It performs the following actions:
* checks for dependencies
* pulls latests revision of repo and updates submodules
* backs up existing file/folders to `$HOME/.dotfiles-backup/`
* installs files
* creates `$HOME/.vim/tmp` & `$HOME/.vim/bundle` if they dont already exist
* installs [Vundle](https://github.com/gmarik/Vundle.vim) if not installed already
* installs/updates Vim plugins via Vundle  

The main differences from Giannis script is that the `$HOME/.vim/tmp` & `$HOME/.vim/bundle` folders are not removed and recreated and that Vim plugins are installed via Vundle rather than submodules

## Usage

### Install read only
```
git clone https://github.com/BradDenver/dotfiles.git && cd dotfiles && source bootstrap.sh
```

### Install read write
Assuming a GitHub username of "UserName", fork of this repo and then
```
git clone https://UserName@github.com/UserName/dotfiles.git && cd dotfiles && source bootstrap.sh
```

### Update
```
source ~/dotfiles/bootstrap.sh
```
