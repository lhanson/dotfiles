# dotfiles

An aggregation of dotfiles, scripts, and various configuration to facilitate
going from a clean, new user account to a fully customized and familiar
environment in one command. The setup script strives to keep things lean and
clean by only installing things which will actually be useful on the particular
host you're on. Clutter is kept to a minimum by adhering to the
[XDG Base Directory Specification](https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html).

Another major principle is to keep units of functionality separate, even within
a given program. For example, bash configuration is split up into separate
files which are sourced as needed rather than constantly appended into an
unreadable monolith.

## Prerequisites

* a POSIX shell (to run the setup script itself)
* either GNU `stow`, or:
	`make`, `curl`, `perl5` (setup script needs them to install `stow`)


## Installing

Log into your fresh new shell environment and run this guy:

    git clone https://github.com/lhanson/dotfiles.git .dotfiles && .dotfiles/setup.sh

### Installing on a remote host

This is a little bit of chicken-and-egg; you need this repository on a machine
containing your private key for GitHub, from where you run the
`seed-dotfiles.sh` script to initialize the environment on the new host.
Run that like so:

	./seed-dotfiles.sh <username@remote.system.example>

That will set up passwordless login and copy the GitHub SSH key to the new
host, then clone a new copy of this repository, and finally it will call
`setup.sh` on the new host to initialize all of the linked dotfiles. Then
you're up and running there on pretty much even footing as the host you seeded
it from, except that your private SSH key for passwordless login is not copied
to the new host.


## Updating

Update repository as needed (`git pull`), and simply run `setup.sh` again.


## Fonts and you

There are many layers of font madness to contend with, at least in my corner
of the Arch/Linux world; a baseline understanding of
[fontconfig](https://www.freedesktop.org/wiki/Software/fontconfig/) is very
helpful, as is learning from others' pain \[[1](https://eev.ee/blog/2015/05/20/i-stared-into-the-fontconfig-and-the-fontconfig-stared-back-at-me/)\],
\[[2](https://seasonofcode.com/posts/how-to-set-default-fonts-and-font-aliases-on-linux.html)\].
The basic idea is to use fontconfig's flexible resolution of what font best
matches an application's query and the ability to add aliases and fallbacks
for when glyphs can't be rendered. This allow us to specify a list of
preferred fonts in `$XDG_CONFIG_HOME/fontconfig/fonts.conf` that
applications will use when asking for 'monospace', 'serif', etc., which means
that we can genericize references elsewhere (e.g. `.Xresources`) and only
have to update configuration in one place (`fonts.conf`) for changes to take
effect everywhere (ideally).

When trying to debug why the font you're expecting isn't being used,
`fc-match` is indispensible (see also the `--sort` option) to put yourself in
an application's shoes and see what fontconfig is telling it.


## Program specifics

As an overview/reminder of how individual applications manage their configs,
here are more specific descriptions of relevant programs.

### Bash

Login (`.bash_profile`) and interactive (`.bashrc`) scripts are very simple,
merely sourcing the appropriate individual configuration units located in
`$XDG_CONFIG_HOME/bash`[1](https://chr4.org/blog/2014/09/10/conf-dot-d-like-directories-for-zsh-slash-bash-dotfiles/).

Confused about what loads when? [Check this out](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/).

Tab-completion depends on `bash-completion` being installed via the package manager.


### Vim

Plugins are managed with [dein.vim](⎈https://github.com/Shougo/dein.vim).
Configuration is modularized between vim and nvim via a number of separate
scripts on the runtimepath to configure things like mappings, plugins, and
other settings more granularly than one gigantic `vimrc`.

### git

If installed on the system, shell completion is enabled as well as repository
status in the prompt.


## Testing changes

When making larger changes, it's quite useful to have a fresh OS to install to
in order to test configs without unintentional interactions with other
installed software.

To that end, Docker comes in quite handy. `Dockerfile` contains a description
of a Docker image which will allow you to run a clean CentOS container. To
build the image from the repo's root directory, run:

    docker build -t dotfiles-centos .

Note that this is only necessary initially, or after making changes to the
repo. To start a container, run:

    docker run --interactive --tty --rm --user username dotfiles-centos

That should drop you into a bash prompt in your new dotfiles directory on
CentOS, where you can run the `setup.sh` script.

As a lazy alternative, you can run the `docker-test.sh` script which will do
all of those steps for you, including runing the setup script.
