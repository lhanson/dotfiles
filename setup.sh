#!/bin/sh

echo "Setting up dotfiles..."
set -e	# exit immediatly on failure

# Path to this script, will be used as the stow directory
STOW_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Specify a default config dir if it isn't already set
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"


# Tests whether a specified command ($1) is available
function is_installed {
	# we expect things to not be installed, don't quit here..
	command -v $1 >/dev/null 2>&1
}

# If a command ($1) is available, stow a package ($2)
function if_installed {
	if is_installed $1; then
		stow $2
	fi
}

# If a file ($1) is available, stow a package ($2)
function if_file_exists {
	if [[ -f $1 ]]; then
		stow $2
	fi
}

# Tests whether we're running on OS X
function is_osx {
	[[ `uname -s` == "Darwin" ]]
}

# Evaluates a command ($1), prepending a specified prefix ($2)
function indent {
	eval $1 2>&1 > /dev/null | sed "s/^/[$2] /"
}

# Test whether stow is installed *before* we redefine it as a function
if [[ -x "$(command -v stow)" || -f $HOME/bin/stow ]]; then
	stow_installed=0
else
	stow_installed=1
fi

# Stows a package ($1), handling indentation and common functionality
function stow {
	if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
		printf '!!!!!! Your $PATH is missing ~/bin, you might want to add it.\n'
		PATH="$PATH:$HOME/bin"
	fi
	echo
	indent "command stow -vv --restow $1" $1
}


################################################################################
# make sure stow is available
################################################################################
if [[ $stow_installed == "1" ]]; then
	is_installed perl || { echo "ERROR: perl not found, can't install stow"; exit 1; }
	is_installed curl || { echo "ERROR: curl not found, can't install stow"; exit 1; }

	# Can't use 2.2.2, installation breaks if texi2html is not present. see
	# https://lists.gnu.org/archive/html/info-stow/2016-11/msg00004.html
	stow_version="2.2.0"
	printf "\n\n###### stow is not installed, bootstrapping\n"
	cd /tmp
	indent "curl --output stow.tar.gz https://ftp.gnu.org/gnu/stow/stow-${stow_version}.tar.gz" "curl stow"

	echo
	indent "tar -zxvf stow.tar.gz" "unpack stow"
	indent "rm -f stow.tar.gz" "remove stow tarball"

	cd stow-${stow_version}
	echo
	share_dir=${STOW_DIR}/stow/.local/share
	indent "./configure --prefix=${STOW_DIR}/stow --datarootdir=$share_dir --with-pmdir=$share_dir" "configure stow"
	indent "make install" "install stow"

	# Bootstrap per https://www.gnu.org/software/stow/manual/html_node/Bootstrapping.html
	echo
	cd $STOW_DIR
	indent "stow/bin/stow -vv --stow stow" "stow stow"
	indent "rm -fr /tmp/stow-${stow_version}" "removing stow source"
else
	printf "\nstow is already installed, skipping bootstrap\n"
fi


################################################################################
# packages to always install
################################################################################
printf "\n\n###### installing common packages\n"
stow ack
if [[ -f $HOME/.bash_profile ]]; then
	printf "\n\n!!!!!! Found an existing ~/.bash_profile, moving to $STOW_DIR/backup"
	mkdir -p $STOW_DIR/backup
	echo ".*" > $STOW_DIR/backup/.stow-local-ignore
	mv $HOME/.bash_profile $STOW_DIR/backup
fi
if [[ -f $HOME/.bashrc ]]; then
	printf "\n\n!!!!!! Found an existing ~/.bashrc moving to $STOW_DIR/backup"
	mkdir -p $STOW_DIR/backup
	echo ".*" > $STOW_DIR/backup/.stow-local-ignore
	mv $HOME/.bashrc $STOW_DIR/backup
fi
stow bash
stow git
stow readline


################################################################################
# packages installed if corresponding program is detected
################################################################################
printf "\n\n###### detecting conditional packages\n"
if_file_exists /chub/conf/environment caos
if_installed chunkwm chunkwm
if_installed compton compton
if_installed fc-match fontconfig
if_installed i3 i3
if_installed mutt mutt
if_installed neomutt mutt
if_installed nvim nvim
if_installed polybar polybar
if_installed powerline powerline
if_installed ranger ranger
if_installed rofi rofi
if_installed skhd skhd
if_installed vim vim
if_installed wal wal
if is_installed weechat; then
	# Location of CA certs varies between OS X/Homebrew and Arch
	# https://weechat.org/files/doc/devel/weechat_faq.en.html#irc_ssl_freenode
	mkdir -p $XDG_CONFIG_HOME/weechat
	if is_osx; then
		ln -sf /usr/local/etc/openssl/cert.pem $XDG_CONFIG_HOME/weechat/ca-certs
	else
		ln -sf /etc/ssl/certs/ca-certificates.crt $XDG_CONFIG_HOME/weechat/ca-certs
	fi
fi
if_installed xterm xterm


################################################################################
# packages installed on systems running a GUI
################################################################################
if [[ is_osx ||  -z ${DISPLAY+x} ]]; then
	printf "\n\n###### installing cross-platform GUI packages\n"
	stow idea
fi


################################################################################
# packages installed on systems running Xorg
################################################################################
if is_installed X; then
	printf "\n\n###### installing Xorg packages\n"
	stow gtk-3.0
	stow mimeapps
	stow Xorg
fi


################################################################################
# OS X packages
################################################################################
if is_osx; then
	printf "\n\n###### installing OS X packages\n"
	stow iterm2
	stow karabiner
	if is_installed wal; then
		stow wal-osx
	fi
fi

printf "\n\n###### Done!\n"
printf "\nNow simply maintain this clone with push/pull to stay in sync!\n"
printf "* Note: this script is idempotent, re-run to install newly pulled dotfiles\n\n"
