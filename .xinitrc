#!/bin/sh

# /etc/X11/xinit/xinitrc
#

# invoke global X session script
sh ~/.screenlayout/layout.sh
compton -b
. /etc/X11/Xsession
