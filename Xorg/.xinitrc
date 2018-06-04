#!/bin/sh
# Executed by startx, run your window manager from here

# We're not running a display manager, so merge Xresources manually
xrdb $HOME/.Xresources

# Start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Fire up the window manager
exec i3
