# Dockerfile for testing setup script and process of fresh installation
FROM centos:7

RUN yum --assumeyes update && \
	yum --assumeyes install git epel-release && \
	curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo && \
	yum --assumeyes install neovim && \
	yum clean all

COPY . /dotfiles
