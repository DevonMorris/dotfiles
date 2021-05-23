#!/bin/sh

# invoke global X session script
xrdb -m $HOME/.Xresources
source ~/.screenlayout/layout.sh
exec dbus-launch --exit-with-session awesome
