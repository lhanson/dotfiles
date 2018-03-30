#!/bin/sh
#
# Simple one-shot script to build the Docker image for testing
# fresh dotfile setups and dump you into a shell.
#

# Build the docker image
docker build -t dotfiles-centos .

# Run a container
docker run --interactive --tty --rm --user username dotfiles-centos
