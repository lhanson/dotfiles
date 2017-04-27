#/bin/bash
#
# Copies SSH keys to the specified host
#
#######################################
if [ -z "$1" ]; then
	me=`basename $0`
	echo "You must provide an argument specifying the username/host to seed, e.g.: \"$me username@foo.bar\""
else
	echo "Making sure ~/.ssh exists on remote host..."
	ssh $1 'mkdir -p -m 700 ~/.ssh'
	echo "Copying private SSH key to remote host for passwordless logins..."
	scp ~/.ssh/id_rsa.pub $1:\~/.ssh/authorized_keys
	ssh $1 'chmod 600 ~/.ssh/authorized_keys'
	echo "Copying github SSH key to remote host..."
	scp ~/.ssh/github $1:\~/.ssh

	ssh $1 <<-EOF
		echo 'eval \`ssh-agent -s\` && ssh-add ~/.ssh/github' > /tmp/ssh-agent 
		echo 'source /tmp/ssh-agent;git clone https://github.com/lhanson/dotfiles.git .dotfiles && .dotfiles/setup.sh' >> .bash_profile
	EOF

	echo "Logging you back in to initialize the new environment..."
	ssh $1
fi
