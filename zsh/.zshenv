## TODO: give context on what this file does and when it is sourced here
## Added by Justine on 151010 according to: https://lxl.io/xdg-config-home
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR=$XDG_CONFIG_HOME/vim

## to be available in vim as per https://unix.stackexchange.com/questions/113462/how-can-i-make-shell-aliases-available-when-shelling-out-from-vim
