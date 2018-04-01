################################################################################
# .bash_profile
################################################################################

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# Load all files from our login session config directory
if [ -d $HOME/.config/bash/login.d ]; then
  for file in $HOME/.config/bash/login.d/*.bash; do
    source $file
  done
fi
