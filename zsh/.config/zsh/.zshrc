
if [[ $OSTYPE == darwin* ]]; then
  source $XDG_CONFIG_HOME/shell/osx
fi

# Path to oh-my-zsh installation
if [ -d "$HOME/.oh-my-zsh" ]; then
  ZSH="$HOME/.oh-my-zsh"
else
  ZSH=/usr/share/oh-my-zsh
fi

# interchangeable _ and -
HYPHEN_INSENSITIVE="true"

# disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="false"

HISTFILE=~/.history
HISTSIZE=100000
HISTFILESIZE=100000
SAVEHIST=1000000
HISTIGNORE="ls"

# command execution time stamp shown in the history command output
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# load plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## TODO comment on what these plugins do
plugins=(git extract z)

# User configuration

## Added by Justine to add colours to terminal 140309
## https://miaobaozhen.blogspot.co.uk/2012/08/how-to-solve-ls-unparsable-value-for.html
export CLICOLOR=1
export CLICOLOR_FORCE=1
## make it compatible with OS X: https://unix.stackexchange.com/questions/91937/mac-os-x-dircolors-not-found/91978#91978
if whence dircolors >/dev/null; then
  [ -z $LS_COLORS ] && eval `dircolors -b $XDG_CONFIG_HOME/shell/dir_colors`
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
  zstyle ':completion:*' list-colors ''
fi

export PATH=$HOME/bin:usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
export PYTHONPATH=:$PYTHONPATH ## so that it includes current directory

## initialise shell via oh-my-zsh /!\ gives options from oh-my-zsh
mkdir -p /tmp/zsh/
export ZSH_COMPDUMP="/tmp/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
source $ZSH/oh-my-zsh.sh

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $XDG_CONFIG_HOME/shell/aliases
source $XDG_CONFIG_HOME/shell/env
source $XDG_CONFIG_HOME/shell/welcome
source $XDG_CONFIG_HOME/zsh/functions

## terminal vi mode: http://dougblack.io/words/zsh-vi-mode.html
bindkey -v

## http://zsh.sourceforge.net/Doc/Release/Options-Index.html
setopt appendhistory ## append history of multiple parallel zsh sessions in order they exit
setopt hist_ignore_dups ## only enter command ran multiple times in a row in history once
setopt beep ## beep on error
setopt notify ## report background job status immediately (?)
setopt nomatch ## print error if a pattern for filename generation has no matches
setopt correct ## autocorrects mistyped commands
setopt autocd ## if the command is the name of a directory, cd into it
setopt extendedglob ## http://www.refining-linux.org/archives/37/ZSH-Gem-2-Extended-globbing-and-expansion/
setopt globdots ## zsh completion to show hidden files and folders

## from https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

## suffix aliases: open extensions in preferred application
alias -s html=firefox

## global aliases: can be used anywhere in the command
alias -g ...='../..'

## Added by Justine 151001 for Redshift as described here:
## https://cberhard.wordpress.com/2015/06/02/using-systemd-user-services/
#case $DISPLAY:$XAUTHORITY in
#  :*:?*)
#    # DISPLAY is set and points to a local display, and XAUTHORITY is set,
#    # so merge the contents of `$XAUTHORITY` into ~/.Xauthority
#    XAUTHORITY=~/.Xauthority xauth merge "$XAUTHORITY";;
#esac

## zsh completion library, including git completion
zstyle :compinstall filename '$XDG_CONFIG_HOME/zsh/.zshrc'
## below not needed since it's in oh-my-zsh
#autoload -Uz compinit
## from https://unix.stackexchange.com/questions/391641/separate-path-for-zcompdump-files
#compinit -d $ZSH_COMPDUMP ## the extra -d option is to store zcompdump elsewhere

## theme for the prompt, needs to be at the end of this file
## based on the Oh My ZSH theme terminalparty
## TODO comment the different parts of the prompt
## good tuto: https://code.tutsplus.com/tutorials/how-to-customize-your-command-prompt--net-24083
PROMPT='%(?,%{$fg[green]%},%{$fg[red]%}) $%{$reset_color%} ' ## dollar sign depending on exit code
RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$fg[blue]%}%m%{$reset_color%}' ## pwd user
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"

## for vimode shell, have prompt include which mode it is in
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  esac
  ## TODO why do I need to repeat PROMPT here ?
  PROMPT='%(?,%{$fg[green]%},%{$fg[red]%}) $%{$reset_color%} '
  VIMODE_PROMPT="%{$fg[black]%}${${KEYMAP/vicmd/[N]}/(main|viins)/[I]}"
  PS1='
 '$VIMODE_PROMPT$PROMPT
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

## Open new terminal in same directory
## https://faq.i3wm.org/question/150/how-to-launch-a-terminal-from-here/
newZle() {
  zle push-line
  BUFFER="setsid urxvt &>/dev/null"
  zle accept-line
}
zle -N newZle
bindkey '\e^M' newZle

