################################################################################
# prompt.bash - a dollar sign for $PS1 is pretty cool, but we can do better
################################################################################
# Prompt silliness
GREEN="\[\e[00;32m\]"
BLUE="\[\e[01;34m\]"
BLACK="\[\e[00;30m\]"
WHITE="\[\e[01;37m\]"
RED="\[\e[00;31m\]"
bold=$(tput bold)
normal=$(tput sgr0)

export PS1="$GREEN\u@\h $WHITE\W$RED$GIT_PS1$DOCKER_PS1 $BLUE\[\e[00m\] ${bold} →${normal} "
