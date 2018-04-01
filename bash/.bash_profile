# Executed from an interactive shell, once per login.
# See .bashrc for non-interactive commands run each time
# the shell is invoked.

echo "bash profiling"
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
# Get machine-specific aliases
if [ -f ~/.bash_profile.local ]; then . ~/.bash_profile.local; fi
# Enable bash completion if installed
if [ -f /usr/local/etc/bash_completion.d ]; then . /usr/local/etc/bash_completion.d
elif type -P brew &> /dev/null; then . `brew --prefix`/etc/bash_completion
fi
# Path suffixes to ignore when doing shell completion
export FIGNORE=VS:svn
export PATH=/chub/bin:~/bin:$GRAILS_HOME/bin:/usr/local/bin:$PATH

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     mkdir -p $HOME/.ssh
     ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     #ssh-add
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# Enable git completion if installed
if [ -f ~/.git-completion ]; then 
    . ~/.git-completion;
    # Show current branch in prompt
    GIT_PS1='$(__git_ps1 " (%s)")'
    #if ! [ -z "$GIT_PS1" ]; then GIT_PS1=" $GIT_PS1 "; fi
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWSTASHSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
fi

# Adjust for a dark background. See http://geoff.greer.fm/lscolors/
LSCOLORS='gxfxcxdxbxegedabagacad' ; export LSCOLORS

# Store more history, ignoring dupes
export HISTCONTROL=erasedups
export HISTSIZE=1000
shopt -s histappend

# Vim, everywhere.
export EDITOR=vim

# enable extended globbing
shopt -s  extglob

export EDITOR=vim


# Common Git workflows
function merge() {
    git checkout master && \
        git pull && \
        git branch -d $1
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ldhanson2/.sdkman"
[[ -s "/Users/ldhanson2/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ldhanson2/.sdkman/bin/sdkman-init.sh"
