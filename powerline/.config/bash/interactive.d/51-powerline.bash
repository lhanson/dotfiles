################################################################################
# powerline.bash - a dollar sign for $PS1 is pretty cool, but we can do better
################################################################################

# Powerline - https://wiki.archlinux.org/index.php/Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
if [[ -f /usr/local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh ]]; then
	source /usr/local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
elif [[ -f /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh ]]; then
	source /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi
