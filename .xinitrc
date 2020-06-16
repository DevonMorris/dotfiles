#!/bin/sh

# invoke global X session script
xrdb -m $HOME/.Xresources
sh ~/.screenlayout/layout.sh
compton -b
exec dbus-launch --exit-with-session i3
