#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
eval "$DIR/lib.py"
if [ $? -eq 0 ]; then
	printf "\nReloading ~/.bash_profile\n"
	source ~/.bash_profile
	printf "\nDone! Now simply maintain this clone with push/pull to stay in sync!\n\n"
fi
