################################################################################
# environment.bash - configuration setting environment variables
################################################################################

export PATH=~/bin:$PATH

# Directory where dotfiles are managed with stow
DOTFILES_DIR=~/.dotfiles

# XDG: see https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# Explicitly set XDG locations for software which respects the variable
# but doesn't follow the spec as far as defaults.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Command history
################################################################################
# Store more history, ignoring dupes
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# Store this many commands in history
export HISTSIZE=1000
