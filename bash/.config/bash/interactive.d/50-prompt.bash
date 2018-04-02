################################################################################
# prompt.bash - a dollar sign for $PS1 is pretty cool, but we can do better
################################################################################

# Enable bash-powerline git prompt if installed
if [ -f $XDG_CONFIG_HOME/git/bash-powerline.bash ]; then 
	source $XDG_CONFIG_HOME/git/bash-powerline.bash
else
	GREEN="\[\e[00;32m\]"
	WHITE="\[\e[01;37m\]"
	normal=$(tput sgr0)
	# username@host cwd →"
	export PS1="$GREEN\u@\h $WHITE\W →${normal} "
fi
