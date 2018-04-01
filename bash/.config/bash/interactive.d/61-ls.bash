################################################################################
# ls.bash - aliases and functions to modify the behavior of `ls`
################################################################################

alias l='ls -lAh'	# long listing, show hidden, human sizes 
alias la='ls -A'	# short listing, show hidden
alias ll='ls -l'	# long listing

# Adjust for a dark background. See http://geoff.greer.fm/lscolors/
export LSCOLORS='gxfxcxdxbxegedabagacad'

# OS-specific workarounds
################################################################################
if [[ `uname` =~ "SunOS" ]]; then
	# Work around non-awesome Solaris 'ls' which lacks color
	LS_ARGS='-F'
elif [[ `uname` =~ "Linux" ]]; then
	LS_ARGS='--color=auto'
	alias docker='sudo docker'
else
	LS_ARGS='-G'
fi

# Override ls to dotfiles by default within certain directories
################################################################################
function ls() {
	local path
	if [[ "$#" -eq 0 || ${@:$#} == -* ]]; then
		path="$PWD" # either no arguments or the last argument is an option, use cwd
	else
		path=${@:$#} # use last argument
	fi

	case $(realpath $path)/ in
		$DOTFILES_DIR/*)
			command ls $LS_ARGS -a $@
			;;
		*)
			command ls $LS_ARGS $@
			;;
	esac
}
