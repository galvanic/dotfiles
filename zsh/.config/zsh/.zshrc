# Path to oh-my-zsh installation
ZSH=/usr/share/oh-my-zsh

ZSH_THEME="robbyrussell"
# ZSH_THEME="terminalparty"

# _ and - will be interchangeable
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

## Added by Justine to add colours to terminal 140309
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagaced
export LS_COLORS=$LSCOLORS
export CLICOLOR_FORCE=1

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration

export PATH=$HOME/bin:usr/local/bin:$PATH
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# check for updates, init shell
source $ZSH/oh-my-zsh.sh

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source $XDG_CONFIG_HOME/shell/aliases
source $XDG_CONFIG_HOME/shell/env
source $XDG_CONFIG_HOME/shell/welcome

## terminal vi mode
bindkey -v

## Added by Justine 151001 for Redshift as described here:
## https://cberhard.wordpress.com/2015/06/02/using-systemd-user-services/
case $DISPLAY:$XAUTHORITY in
  :*:?*)
    # DISPLAY is set and points to a local display, and XAUTHORITY is set,
    # so merge the contents of `$XAUTHORITY` into ~/.Xauthority
    XAUTHORITY=~/.Xauthority xauth merge "$XAUTHORITY";;
esac

