#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Run the bar on each monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --config=$HOME/.config/polybar/config top &
done

echo "Bars launched..."
