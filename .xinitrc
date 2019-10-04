#!/bin/sh

# /etc/X11/xinit/xinitrc
#

# invoke global X session script
xrdb -m $HOME/.Xresources
sh ~/.screenlayout/layout.sh
exec i3
