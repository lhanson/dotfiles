Custom Dotfiles!
================

An aggregation of dotfiles, scripts, and various configuration to facilitate going from a clean,
new user account to a fully customized and familiar environment in one command.

Prerequisites
-------------

In order to install this environment onto a new host, Python must be available.

Installing
----------

Log into your fresh new shell environment and run this guy:

	git clone https://github.com/lhanson/dotfiles.git .dotfiles && .dotfiles/setup.sh https://path/to/your/ssh/config.git

Depending on your setup, you may be prompted for credentials to one or both of those repositories.
Files in this repo will be linked to from their familiar ~/.* paths, and Neovim will install configured plugins on first launch.

Updating
--------

TODO
