################################################################################
# environment.bash - configuration setting environment variables
################################################################################

# Directory where dotfiles are managed with stow
export DOTFILES_DIR=~/.dotfiles

# XDG: see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# Explicitly set XDG locations for software which respects the variable
# but doesn't follow the spec as far as defaults.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
if [[ -d /run/user/$(id -u) ]]; then
	# Looks like systemd is in play
	export XDG_RUNTIME_DIR=/run/user/$(id -u)
elif [[ -d $TMPDIR ]]; then
	export XDG_RUNTIME_DIR=$TMPDIR
else
	export XDG_RUNTIME_DIR=/tmp/$(id -u)
fi
# This isn't defined by the spec, but I think it probably should be.
export XDG_LIB_HOME=$HOME/.local/lib

export GOPATH=$XDG_LIB_HOME/go
export PATH=$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH


# Command history
################################################################################
# Store more history, ignoring dupes
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# Store this many commands in history
export HISTSIZE=1000
