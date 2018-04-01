#
# ~/.bashrc
#

export PATH=~/bin:$PATH
# Directory where dotfiles are managed with stow
DOTFILES_DIR=~/.dotfiles
# Explicitly set XDG locations for software which respects the variable
# but doesn't follow the spec as far as defaults.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Prompt silliness
GREEN="\[\e[00;32m\]"
BLUE="\[\e[01;34m\]"
BLACK="\[\e[00;30m\]"
WHITE="\[\e[01;37m\]"
RED="\[\e[00;31m\]"
bold=$(tput bold)
normal=$(tput sgr0)
export PS1="$GREEN\u@\h $WHITE\W$RED$GIT_PS1$DOCKER_PS1 $BLUE\[\e[00m\] ${bold}⇁ →${normal} "


# TODO: currently used for debugging
alias b='vi ~/.bashrc; . ~/.bashrc'
alias d='cd ~/.dotfiles'
alias f='vi ~/.config/fontconfig/fonts.conf'
alias i='vi ~/.config/i3/config'
alias n='vi ~/.config/nvim/init.vim'
alias t='vi ~/.dotfiles/TODO.md'
alias x='vi ~/.Xresources; xrdb -merge ~/.Xresources'
alias v='vi ~/.vim/vimrc'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
echo "...bashrc, interactive non-login shell"

# Set aliases for interactive terminal use
type nvim >/dev/null 2>&01
if [[ $? -eq 0 ]]; then
    alias vi=nvim
else
    alias vi=vim
fi

# Use interactive versions of destructive operations
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias g=git
# Show memory hogs
alias mem='ps -e -orss=,pid=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
# Remove exited docker containers
alias drmc='docker rm $(docker ps -q -f status=exited)'
# Remove unused docker containers
alias drmi="docker images | grep \" [months|days|weeks]* ago\" | awk \"{print $3}\" | xargs docker rmi"
# 'docker stats' show container name instead of ID (pending fix of https://github.com/docker/docker/issues/20973)
alias ds='while true; do TEXT=$(docker stats --no-stream $(docker ps --format={{.Names}})); sleep 0.1; clear; echo "$TEXT"; done'
# Maven - display dependency updates
alias ddu='mvn versions:display-dependency-updates'
# Maven - display plugin updates
alias dpu='mvn versions:display-plugin-updates'

alias activemq="docker run --name='activemq' --interactive --rm -p 8161:8161 -p 61616:61616 -p 61613:61613 webcenter/activemq"
alias graphite="docker run --name graphite   --interactive --rm -p 80:80 -p 2003-2004:2003-2004 -p 2023-2024:2023-2024 -p 8125:8125/udp -p 8126:8126 hopsoft/graphite-statsd"

################################################################################
# OS-specific settings
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

# Show dotfiles by default within certain directories
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
alias l='ls -lAh'
alias la='ls -a'
alias ll='ls -l'

