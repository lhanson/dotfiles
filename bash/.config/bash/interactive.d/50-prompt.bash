################################################################################
# prompt.bash - a dollar sign for $PS1 is pretty cool, but we can do better
################################################################################

# If we're not using powerline for our prompt, set something basic
command -v powerline >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
	GREEN="\[\e[00;32m\]"
	WHITE="\[\e[01;37m\]"
	normal=$(tput sgr0)
	# username@host cwd →"
	export PS1="$GREEN\u@\h $WHITE\W →${normal} "
fi
