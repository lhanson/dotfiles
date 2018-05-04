# Powerline

## Requirements

Have powerline installed (Arch packages are `python-powerline` and optionally
`python-powerline-gitstatus`).

## Theming

Default powerline configuration and color settings live in the Python module
(e.g. /usr/lib/python3.6/site-packages/powerline/config_files) but can be
overridden in $XDG_CONFIG_HOME/powerline. In that directory we override
colors.json to map our desired terminal color numbers
(0-15, as set by wal in $XDG_CACHE_HOME/.wal/colors.Xresources) to the color
names that powerline's `colorschemes` reference.

http://powerline.readthedocs.io/en/master/configuration/reference.html#colorschemes

## Troubleshooting:

* Arrows and symbols not showing up? Try restarting powerline-daemon:
	https://github.com/powerline/fonts/issues/44#issuecomment-315610065
