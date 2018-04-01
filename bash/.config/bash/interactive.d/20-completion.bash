################################################################################
# completion.bash - automatic tab-completion of various commands
################################################################################

# enable extended globbing
shopt -s  extglob

# bash completion
################################################################################
[[ -f /usr/share/bash-completion/bash_completion ]] && \
	source /usr/share/bash-completion/bash_completion

# git completion
################################################################################
[[ -f /usr/share/git/completion/git-prompt.sh ]] && \
	source /usr/share/bash-completion/completions/git

# Path suffixes to ignore when doing shell completion
export FIGNORE=VS:svn
