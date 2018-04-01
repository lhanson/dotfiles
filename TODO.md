# Test on OS X

[ ] Git completion seems to be built into the arch package, so I
    commented out the bit in .bashrc where I specifically look for
	`~/.git-completion`. If that's still needed, add it to the
	setup script.


# Setup script: short-term wins

[ ] Have the setup script optionally take a remote user/hostname as an argument,
    making `seed-dotfiles.sh` redundant.


# Theming

[ ] Abstract theme colors from Xresources by referencing an external
		link to the current theme.
		https://wiki.archlinux.org/index.php/x_resources#Load_resource_file


# Setup script: larger improvements

[ ] Add a Dockerfile for testing on Arch

[ ] More elegant conflict handling. Most systems will have a default `.bash_profile`,
    it would be better to detect conflicts (`stow --simulate`) and back them up
    automatically

[ ] Colored output in setup script to more easily tell what's happening at a glance
