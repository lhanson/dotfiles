################################################################################
# aliases.bash - aliases for interactive commands
################################################################################

# Handy aliases for editing configuration files
################################################################################
alias brc='vi ~/.bashrc; . ~/.bashrc'
alias bp='vi ~/.bash_profile; . ~/.bash_profile'
alias d='cd $DOTFILES_DIR'
alias f='vi $XDG_CONFIG_HOME/fontconfig/fonts.conf'
alias i='vi $XDG_CONFIG_HOME/i3/config'
alias n='vi $XDG_CONFIG_HOME/nvim/init.vim'
alias t='vi $DOTFILES_DIR/TODO.md'
alias x='vi ~/.Xresources; xrdb -merge ~/.Xresources'
alias vrc='vi ~/.vim/vimrc'

# Git
################################################################################
alias g=git
# Common Git workflows
function merge() {
    git checkout master && git pull && git branch -d $1
}

# Text editing
################################################################################
type nvim >/dev/null 2>&01
if [[ $? -eq 0 ]]; then
	alias vi=nvim
else
	alias vi=vim
fi

# Use interactive versions of destructive operations
################################################################################
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Sysadmin housekeeping
################################################################################
# Show memory hogs
alias mem='ps -e -orss=,pid=,args= | sort -b -k1,1n | pr -TW$COLUMNS'

# Docker
################################################################################
# Remove exited docker containers
alias drmc='docker rm $(docker ps -q -f status=exited)'
# Remove unused docker containers
alias drmi="docker images | grep \" [months|days|weeks]* ago\" | awk \"{print $3}\" | xargs docker rmi"
# 'docker stats' show container name instead of ID (pending fix of https://github.com/docker/docker/issues/20973)
alias ds='while true; do TEXT=$(docker stats --no-stream $(docker ps --format={{.Names}})); sleep 0.1; clear; echo "$TEXT"; done'

# Services used often for local development
################################################################################
alias activemq="docker run --name='activemq' --interactive --rm -p 8161:8161 -p 61616:61616 -p 61613:61613 webcenter/activemq"
alias graphite="docker run --name graphite   --interactive --rm -p 80:80 -p 2003-2004:2003-2004 -p 2023-2024:2023-2024 -p 8125:8125/udp -p 8126:8126 hopsoft/graphite-statsd"
