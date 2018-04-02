################################################################################
# completion.bash - automatic tab-completion of various commands
################################################################################

# enable extended globbing
shopt -s  extglob

# bash completion
################################################################################
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
	source /usr/share/bash-completion/bash_completion
elif [[ $(command -v brew) && \
		-f $(brew --prefix)/share/bash-completion/bash_completion ]]; then
	source $(brew --prefix)/share/bash-completion/bash_completion
fi

# Path suffixes to ignore when doing shell completion
export FIGNORE=VS:svn
