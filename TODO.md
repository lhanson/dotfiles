# Immediate Issues

[ ] Intellij - running from Rofi doesn't read IDEA_PROPERTIES

[ ] gnome-keyring: this starts up an ssh-agent as well, do I 
	need to disable one or the other?

[ ] Multi-monitor setup; Cinema Display will connect at home, but things get
	garbled/tiled when compton is running.
	- Manually connecting: xrandr --output DP1 --auto --left-of eDP1; wal -R
	- Might be able to just run feh on the new display rather than wal -R.
	- Perhaps incorporate into udev rule

[ ] Get nm-applet working for non-root user, including VPN setup.

[ ] Look into `powertop` recommendations

[ ] Configure dunst

# Bash

[ ] Move ~/.git-completion into .config or something

[ ] Currently, it looks like if powerline isn't installed we don't source
    git-completion, so we're not getting the cool branch indicator

# Bugs

[ ] Switching to xterm didn't solve the issue of (n)vim sporadically not
	rendering blocks of text when scrolling/loading
	- Compton seems to be at fault here, perhaps:https://github.com/chjj/compton/issues/313
	  Yep: `killall compton` fixes (most of?) it
	Trying suggestions for compton config in Vertical Sync section of https://wiki.archlinux.org/index.php/Nouveau

# Productivity 

[ ] Configure weechat;

[ ] Google hangouts app


# Polybar

[ ] Power indicator doesn't show "charging"
[ ] Battery icon is cut off
[ ] Investigate plugins: https://github.com/x70b1/polybar-scripts


# Setup script: short-term wins

[ ] Have the setup script optionally take a remote user/hostname as an argument,
    making `seed-dotfiles.sh` redundant.


# Thinkpad

[ ] if `acpi` is present, warn when battery is getting low

[ ] Nice to have: browser scroll with the thinkpad pointing stick


# Setup script: larger improvements

[ ] Initial step: move existing files to backup/ to avoid conflict on initial setup
	and reduce clutter in ~

[ ] Add a Dockerfile for testing on Arch

[ ] More elegant conflict handling. Most systems will have a default `.bash_profile`,
    it would be better to detect conflicts (`stow --simulate`) and back them up
    automatically

[ ] Colored output in setup script to more easily tell what's happening at a glance
