################################################################################
# third-party.bash - setup for third-party toolchains
################################################################################

# RVM - https://rvm.io/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && \
	# Load RVM into a shell session *as a function*
	source "$HOME/.rvm/scripts/rvm"

# iterm2 - https://www.iterm2.com/
test -e "${HOME}/.iterm2_shell_integration.bash" && \
	source "${HOME}/.iterm2_shell_integration.bash"
