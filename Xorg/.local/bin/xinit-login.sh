#!/bin/sh
# This script is run by the xinit-login systemd unit, which allows us to
# boot directly into a logged-in X environment

# Avoid permissions errors with virtual consoles
chmod g+rw /dev/tty*
# Run X as my user
/bin/su ldh --login --command /usr/bin/startx
