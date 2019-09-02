#!/bin/sh

# /etc/X11/xinit/xinitrc
#

# invoke global X session script
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
sh ~/.screenlayout/layout.sh
exec i3
