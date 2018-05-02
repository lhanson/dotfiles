#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
	echo "ERROR: This program must be run as root."
	exit 1
fi

pacman --sync --noconfirm --needed dialog || { echo "Error at script start: Are you sure you're using an Arch-based distro? ;-) Are you sure you have an internet connection?"; exit 1; }
dialog --title "Welcome!" --msgbox "This script will automatically install a fully-featured i3wm Arch Linux desktop." 6 60

name=$(dialog --no-cancel --inputbox "Select a username" 10 60 3>&1 1>&2 2>&3 3>&1)
if id "$name" >/dev/null 2>&1; then
	echo "User $name exists, proceeding"
else
	pass1=$(dialog --no-cancel --passwordbox "Enter a password for that user." 10 60 3>&1 1>&2 2>&3 3>&1)
	pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
	
	while [ $pass1 != $pass2 ]
	do
		pass1=$(dialog --no-cancel --passwordbox "Passwords do not match.\n\nEnter password again." 10 60 3>&1 1>&2 2>&3 3>&1)
		pass2=$(dialog --no-cancel --passwordbox "Retype password." 10 60 3>&1 1>&2 2>&3 3>&1)
		unset pass2
	done
	
	dialog --infobox "Adding user \"$name\"..." 4 50
	useradd -m -g wheel -s /bin/bash $name >/dev/tty6
	echo "$name:$pass1" | chpasswd >/dev/tty6
fi

# Ensure that users in group wheel can run sudo without a password
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $script_dir/sudoers /etc/sudoers

if [[ ! $(command -v aurman) ]]; then
	dialog --infobox "Installing aurman for package management" 4 60
	pacman --sync --noconfirm --needed base-devel git
	cd /tmp
	git clone https://aur.archlinux.org/aurman.git
	chown -R $name:wheel aurman
	cd aurman
	sudo -u $name makepkg --force --syncdeps --rmdeps --install --noconfirm
	cd /tmp
	rm -fr /tmp/aurman
fi

install_package() {
	echo "Installing $1"
	sudo -u $name aurman --noconfirm --needed --sync $1
}


clear

dialog --infobox "Refreshing Arch Keyring..." 4 40
pacman --noconfirm --sync --refresh archlinux-keyring >/dev/tty6



dialog --infobox "Getting list of packages to install..." 4 40
# pacman list
curl https://gist.githubusercontent.com/lhanson/49ecb1f06f1a4cf89624208b41c3ef07/raw > /tmp/pacman-list.pkg
# AUR list
curl https://gist.githubusercontent.com/lhanson/973858b18d5daa7f92f29f679012b3f5/raw >> /tmp/pacman-list.pkg

count=`wc -l /tmp/pacman-list.pkg | cut -f1 -d' '`
n=0
for x in `cat /tmp/pacman-list.pkg`
do
	n=$((n+1))
	printf "Downloading and installing program $n out of $count: $x...\n\n"
	install_package $x
done


dialog --infobox "Enabling Network Manager..." 4 40
systemctl enable NetworkManager
systemctl start NetworkManager

dialog --title "All done!" --msgbox "Congrats! Provided there were no hidden errors, the script completed successfully and all the programs and configuration files should be in place.\n\nTo run the new graphical environment, log out and log back in as your new user, then run the command \"startx\" to start the graphical environment.\n\n-Luke" 12 80
clear

