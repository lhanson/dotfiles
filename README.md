# Custom Dotfiles!

An aggregation of dotfiles, scripts, and various configuration to facilitate going from a clean,
new user account to a fully customized and familiar environment in one command.

## Prerequisites

* a POSIX shell (to run the setup script itself)
* either GNU `stow`, or:
	`make`, `curl`, `perl5` (setup script needs them to install `stow`)

## Installing

Log into your fresh new shell environment and run this guy:

    git clone https://github.com/lhanson/dotfiles.git .dotfiles && .dotfiles/setup.sh

## Installing on a remote host

This is a little bit of chicken-and-egg; you need this repository on a machine containing
your private key for GitHub, from where you run the `seed-dotfiles.sh` script to initialize
the environment on the new host. Run that like so:

	./seed-dotfiles.sh <username@remote.system.example>

That will set up passwordless login and copy the GitHub SSH key to the new host, then
clone a new copy of this repository, and finally it will call `setup.sh` on the new host
to initialize all of the linked dotfiles. Then you're up and running there on pretty much
even footing as the host you seeded it from, except that your private SSH key for
passwordless login is not copied to the new host.

## Updating

Update repository as needed (`git pull`), and simply run `setup.sh` again.

## Testing changes

When making changes, it's quite useful to have a fresh OS to install to in order to
test configs without unintentional interactions with other installed software.

To that end, Docker comes in quite handy. `Dockerfile` contains a description of
a Docker image which will allow you to run a clean CentOS container. To build the image
from the repo's root directory, run:

    docker build -t dotfiles-centos .

Note that this is only necessary initially, or after making changes to the repo. To start
a container, run:

    docker run --interactive --tty --rm --user username dotfiles-centos

That should drop you into a bash prompt in your new dotfiles directory on CentOS, where
you can run the `setup.sh` script.

As a lazy alternative, you can run the `docker-test.sh` script which will do all of those
steps for you, including runing the setup script.

## Program specifics

As an overview/reminder of how individual applications manage their configs, here are
more specific descriptions of relevant programs.

### Vim

`autoload` directory contains files run each time vim starts. Usually used for bootstrapping
plugins, etc.
