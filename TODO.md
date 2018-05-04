# WIP: wal config

[-] Have powerline bash colors use wal-generated theme
	- run powerline-daemon --replace

# Bugs

[ ] Switching to xterm didn't solve the issue of (n)vim sporadically not
	rendering blocks of text when scrolling/loading


# Use stow for managing system-wide files in addition to user-specific dotfiles.

[ ] Maintain /etc/lxdm/lxdm.conf to make i3 the default

[ ] Set lxdm theme


# Productivity 

[ ] Configure weechat;

[ ] Ranger for file management

[ ] Google hangouts app


# Polybar

[ ] Investigate plugins: https://github.com/x70b1/polybar-scripts


# Theming

[ ] lxdm theme. It's terrible, fix it.

[ ] rofi theme

[ ] See https://github.com/khamer/base16-i3 to use base16 for generating other app configs


# Setup script: short-term wins

[ ] Have the setup script optionally take a remote user/hostname as an argument,
    making `seed-dotfiles.sh` redundant.


# Thinkpad

[ ] if `acpi` is present, warn when battery is getting low

[ ] Nice to have: browser scroll with the thinkpad pointing stick


# Setup script: larger improvements

[ ] Add a Dockerfile for testing on Arch

[ ] More elegant conflict handling. Most systems will have a default `.bash_profile`,
    it would be better to detect conflicts (`stow --simulate`) and back them up
    automatically

[ ] Colored output in setup script to more easily tell what's happening at a glance
