# Bash

[ ] Move ~/.git-completion into .config or something

[ ] Currently, it looks like if powerline isn't installed we don't source
    git-completion, so we're not getting the cool branch indicator

# Bugs

[ ] Switching to xterm didn't solve the issue of (n)vim sporadically not
	rendering blocks of text when scrolling/loading


# Productivity 

[ ] Configure weechat;

[ ] Ranger for file management

[ ] Google hangouts app


# Polybar

[ ] Investigate plugins: https://github.com/x70b1/polybar-scripts


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
