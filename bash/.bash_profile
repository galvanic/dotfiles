if [ -f $HOME/.aliases ]; then
	source $HOME/.aliases
fi

if [ -f $HOME/.bash_functions ]; then
	source $HOME/.bash_functions
fi

if [ -f $HOME/.env ]; then
	source $HOME/.env
fi

## Added by Justine 150205
HISTSIZE=10000
HISTCONTROL=ignoreboth
shopt -s histappend ## set zsh type options

shopt -s autocd
shopt -s extglob

## Added by Justine to add colours to terminal 140309
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagaced
export LS_COLORS=$LSCOLORS
export CLICOLOR_FORCE=1

## Added by Justine for EMAN2 on 140308
#test -r /Applications/EMAN2/eman2.bashrc && source /Applications/EMAN2/eman2.bashrc

## Added by Justine 150302: pretty prompt
## colors from https://wiki.archlinux.org/index.php/Color_Bash_Prompt
## http://bneijt.nl/blog/post/add-a-timestamp-to-your-bash-prompt/
## http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
source ~/.git-prompt.sh
WHITE='\e[0;37m'
RED='\e[0;31m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
BLUE='\e[0;34m'
BLACK='\e[0;30m'
PS1="\[$GREEN\]\u\[$CYAN\] \w\[$RED\]\$(__git_ps1) \[$WHITE\]\$ "

## Added by Justine 150303 for todo.sh completions
source "/Users/jc5809/Applications/todo.txt_cli-2.10/todo_completion"
complete -F _todo t

## Added by Justine 150504
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

