Custom Dotfiles!
================

An aggregation of dotfiles, scripts, and various configuration to facilitate going from a clean,
new user account to a fully customized and familiar environment in one command.

Prerequisites
-------------

In order to install this environment onto a new host, Python must be available.

Installing on a new host
------------------------

This is a little bit of chicken-and-egg; you need this repository on a machine containing
your private key for GitHub, from where you run the `seed-dotfiles.sh` script to initialize
the environment on the new host. Run that like so:

	./seed-dotfiles.sh <username@remote.system.example>

That will set up passwordless login and copy the GitHub SSH key to the new host, then
clone a new copy of this repository, and finally it will call `setup.sh` on the new host
to initialize all of the linked dotfiles. Then you're up and running there on pretty much
even footing as the host you seeded it from, except that your private SSH key for
passwordless login is not copied to the new host.

TODO
----

* Updating instructions; pulling down new config, what about entirely new files?
  Perhaps a git hook to run setup.py again? (Must ensure it's idempotent in that case)
