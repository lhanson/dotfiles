################################################################################
# last.bash - operations which need to happen after all other setup
################################################################################

# SDKMAN - http://sdkman.io/
################################################################################
if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
	export SDKMAN_DIR="$HOME/.sdkman"
	source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
