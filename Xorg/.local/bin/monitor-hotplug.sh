#!/bin/sh
# Handles displays being attached and detached as reported by udev.
# See corresponding rule in /etc/udev/rules.d/

export DISPLAY=:0
export XAUTHORITY=/home/ldh/.Xauthority
logfile=/home/ldh/.cache/udev/monitor-hotplug.log

vgamode="$(cat /sys/class/drm/card0-VGA-1/status)"
if [ "${vgamode}" = disconnected ]; then
	echo "VGA1 disconnected" >> $logfile
	/usr/bin/xrandr --auto
elif [ "${vgamode}" = connected ]; then
	echo "VGA1 connected" >> $logfile
	/usr/bin/xrandr --output VGA1 --auto --left-of eDP1
fi
