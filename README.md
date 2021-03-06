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

This represents user-specific configuration; I also maintain version-controlled
[system configuration](https://github.com/lhanson/Linux-Configuration) for
stuff that needs to be configured by root.

## Prerequisites

* a POSIX shell (to run the setup script itself)
* either GNU `stow`, or:
	`make`, `curl`, `perl5` (setup script needs them to install `stow`)
* git


## Installing

Clone the repo into your $HOME:

    git clone https://github.com/lhanson/dotfiles.git $HOME/.dotfiles

*Optional*: if this is a fresh new Arch installation and you want to install
everything needed to be up and running with a productive environment, run:

    $HOME/.dotfiles/arch-setup/arch-install.sh

Setting up dotfiles:

    $HOME/.dotfiles/setup.sh

This will only install dotfiles for software which the script detects is present.

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


## Fonts

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

Using `gucharmap` can also help you visualize which fonts supply a given glyph
you're looking for.

Console fonts for use in the virtual console can be previewed by giving
`setfont` the name of a font in `/usr/share/kbd/consolefonts`, and permanently
configured by setting e.g. `FONT=ter-powerline-v28n` in `/etc/vconsole.conf`.


## Theming

As there are several places where programs might look for colors, fonts, and
other general theme-related configuration:

	* ~/.Xresources ($XDG_CONFIG_HOME/Xorg/themes/current)
		- font size, font name/alias for apps which use Xresources
		- color theme; loaded from the ~/.config/Xorg/themes/current symlink
	* gtk+3 configuration is done in $XDG_CONFIG_HOME/gtk-3.0
	* ~/images/desktop-background is a symlink to the desired desktop
		background, loaded in the i3 config
	* powerline configs live in ~/.config/powerline

For an index of xterm colors (0-255), see [this cheatsheet](https://jonasjacek.github.io/colors/).

### Generating a theme

Themes can be generated with pywal [pywal](https://github.com/dylanaraps/pywal)
using the convenience script `wal/.local/bin/theme.sh`.

The current background image will be linked to `~/.cache/wal/current-background`,
and a blurred version of it (for lock screen use) is at `~/.cache/wal/current-background-blur.png`.

## Desktop notifications

We handle `libnotify`-based notifications using [Dunst](https://wiki.archlinux.org/index.php/Dunst).

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

Configuration is modularized between vim and nvim via a number of separate
scripts on the runtimepath to configure things like mappings, plugins, and
other settings more granularly than one gigantic `vimrc`.

Using the `dylanaraps/wal.vim` plugin allows vim to use wal-generated
colorschemes.

#### Plugins

Plugins are managed with [dein.vim](⎈https://github.com/Shougo/dein.vim).
Installing a new plugin: add an entry to $XDG_CONFIG_HOME/vim/plugins.vim for
the new plugin and it should be installed the next time (n)vim is run.

### git

If installed on the system, shell completion is enabled as well as repository
status in the prompt.

### chunkwm / skhd (OS X)

The homebrew packages `chunkwm` (tiling window manager) and `skhd`
(hotkey daemon) work in tandem, however their homebrew formulae need a little
convincing in order to load configs from our tidy dotfile directories.
Edit `$(brew --prefix)/Cellar/skhd/<version>/homebrew.mxcl.skhd.plist` and
`$(brew --prefix)/Cellar/chunkwm/<version>/homebrew.mxcl.chunkwm.plist` and
add the `--config` option to the invocations.

There may be application or OS shortcuts that get in your way; disable or add
overrides for them in `System Preferences -> Keyboard -> Shortcuts`[1](https://apple.stackexchange.com/a/286710/5394).

### mutt

Relies on [lastpass-cli](https://helpdesk.lastpass.com/lastpass-command-line-application/)
to resolve credentials.


### WeeChat

Console-based chat client; does IRC, XMPP, Slack, etc.


### Window Manager

`i3-gaps` is the window manager, with `rofi` as its application launcher and
`polybar` as the bar.


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
