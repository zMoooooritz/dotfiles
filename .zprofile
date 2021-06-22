#!/bin/zsh

# Adds ~/.scripts and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"

# ~/ Clean-up
export ZDOTDIR="$HOME/.config/zsh"
export LESSHISTFILE="-"

# Other settings
#export ANDROID_SDK_ROOT="/opt/android-sdk"
export QT_SELECT=5
export QT_STYLE_OVERRIDE="Breeze"
export QT_QPA_PLATFORMTHEME="qt5ct"

# Start graphical server if i3 not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi
