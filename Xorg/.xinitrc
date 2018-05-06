#!/bin/sh
# Executed by startx, run your window manager from here

# We're not running a display manager, so merge Xresources manually
xrdb $HOME/.Xresources
# Fire up the window manager
exec i3
