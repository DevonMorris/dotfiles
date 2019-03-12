#!/bin/sh

xrdb -merge ~/.Xresources
xrandr --output HDMI-1-3 --off --output DVI-D-0 --off --output HDMI-1-2 --off --output HDMI-1-1 --off --output DP-1 --off --output HDMI-0 --off --output DP-1-3 --off --output DP-1-2 --off --output DP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-0 --mode 1920x1080 --pos 1920x0 --rotate normal
exec i3
