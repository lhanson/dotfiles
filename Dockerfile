# Dockerfile for testing setup script and process of fresh installation
FROM centos:7

RUN yum --assumeyes update && \
	yum --assumeyes install git make epel-release && \
	curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo && \
	yum --assumeyes install neovim && \
	yum clean all

RUN useradd -ms /bin/bash username
COPY --chown=username . /home/username/.dotfiles

ENTRYPOINT cd ~/.dotfiles; ./setup.sh; echo "sourcing new ~/.bash_profile..."; source ~/.bash_profile; bash
