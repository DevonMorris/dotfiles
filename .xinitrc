#!/bin/sh

# invoke global X session script
xrdb -m $HOME/.Xresources
sh ~/.screenlayout/layout.sh
compton -b --config $HOME/.compton.conf
exec dbus-launch --exit-with-session i3
