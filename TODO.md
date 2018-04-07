# Productivity 

[ ] messaging app

[ ] google hangouts app


# Polybar

[ ] unicode symbols don't seem to scale at all; too tiny

[ ] volume control doesn't track the mixer settings

[ ] add brightness control

[ ] unicode; various icons don't display without a weird combination of fonts
	being present


# Theming

[ ] lxdm theme. It's terrible, fix it.

[ ] rofi theme

[ ] Write automation using `schemer2` to refresh theme based on wallpaper.
	See also: http://www.xcolors.net/

[ ] See https://github.com/khamer/base16-i3 to use base16 for generating other app configs

[ ] Enable Xresources to read environment variables so we can abstract out
	things like font face and size across different programs' resources


# Bugs

[ ] urxvt delays, rendering hiccups


# Setup script: short-term wins

[ ] Have the setup script optionally take a remote user/hostname as an argument,
    making `seed-dotfiles.sh` redundant.


# Thinkpad

[ ] if `acpi` is present, warn when battery is getting low


# Setup script: larger improvements

[ ] Add a Dockerfile for testing on Arch

[ ] More elegant conflict handling. Most systems will have a default `.bash_profile`,
    it would be better to detect conflicts (`stow --simulate`) and back them up
    automatically

[ ] Colored output in setup script to more easily tell what's happening at a glance
