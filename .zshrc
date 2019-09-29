# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/moritz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias polybarconfig="vim ~/.config/polybar/config"
alias i3config="vim ~/.config/i3/config"
alias vimconfig="vim ~/.vimrc"

alias la="ls -a"
alias ll="ls -lah"
alias svim="sudo vim"
alias sl="sl && clear"
alias SL="sl && clear"
alias dc="figlet 'TYPO'"
alias DC="figlet 'TYPO'"
alias upgrade="sudo pacman -Syu"
alias sysinfo="neofetch | lolcat"
alias feh="feh --image-bg black -Z -."
alias tutorium="pdfpc -d 90 -l 10" # maybee add the option -s again
alias clock="clockywock"
alias clock2="while true; do tput clear; date +'%H : %M : %S' | figlet -c -w 280 ; sleep 1; done"
alias matrix="cmatrix | lolcat"
alias pi="echo 'scale=14; 4*a(1)' | bc -l | figlet | lolcat"
alias wttr="curl wttr.in"

alias viminfo='i3-msg exec "feh --image-bg black -Z -. ~/Pictures/vimcheatsheet.jpg"'

alias py="python"

alias st="~/.config/i3/scripts/streamlink.sh"
alias ard="streamlink -p mpv daserste.de/live best"
alias zdf="streamlink -p mpv zdf.de/live-tv best"
alias trill="streamlink -p mpv twitch.tv/trilluxe best"
alias asmr="streamlink -p mpv twitch.tv/amouranth audio_only"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias apps="~/.config/i3/scripts/apps.sh"
alias binds="~/.config/i3/scripts/binds.sh"
alias screen="~/.config/i3/scripts/screen.sh"
alias mute="~/.config/i3/scripts/mute.sh"

zle_highlight+=(paste:none)

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# neofetch | lolcat
