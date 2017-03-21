#! /bin/bash

[ -f ~/.xprofile ] && source ~/.xprofile
[ -f ~/.xbindkeysrc ] && [[ "$(expr substr $(uname -r) 10 14)" == "ARCH" ]] && xbindkeys
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec i3
