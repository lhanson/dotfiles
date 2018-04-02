################################################################################
# tab-completion.bash - automatic tab-completion of various commands
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

# Docker for Mac completion
################################################################################
[[ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ]] && \
	source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
[[ -f /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion ]] && \
	source /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
[[ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ]] && \
	source /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion

# Path suffixes to ignore when doing shell completion
export FIGNORE=VS:svn
