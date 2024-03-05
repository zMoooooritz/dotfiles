#!/bin/zsh

# Adds ~/.scripts and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$HOME/.local/bin:$HOME/.go/bin"


# Default programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="chromium"
export READER="zathura"
export PAGER="less"
export VISUAL="nvim"

# ~/ Clean-up
export ZDOTDIR="$HOME/.config/zsh"
export LESSHISTFILE="-"
export GOPATH="$HOME/.go"
export GO111MODULE="auto"

# Other settings
#export ANDROID_SDK_ROOT="/opt/android-sdk"
# export QT_SELECT=5
# export QT_STYLE_OVERRIDE="gtk2"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME="Arc:dark"

# Start graphical server if i3 not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi
