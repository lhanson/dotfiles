################################################################################
# .bashrc
################################################################################

if [[ $- != *i* ]] ; then
	# shell is non-interactive. be done now!
	return
fi

# Load all files from our interactive session config directory
if [ -d $HOME/.config/bash/interactive.d ]; then
	for file in $HOME/.config/bash/interactive.d/*.bash; do
		source $file
	done
fi
