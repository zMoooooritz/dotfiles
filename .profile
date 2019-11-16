[[ -f ~/.bashrc ]] && . ~/.bashrc

# Adds ~/.scripts and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="vim"
export TERMINAL="termite"
export BROWSER="firefox"
export READER="zathura"

# Start graphical server if i3 not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx