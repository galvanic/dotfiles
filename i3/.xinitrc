#! /bin/bash

[ -f ~/.xprofile ] && source ~/.xprofile
[ -f ~/.xbindkeysrc ] && xbindkeys
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec i3
