# Arch Installation and Configuration Notes

See the various documentation in this directory for specifics on configuring
various subsystems.

## Post-installation configuration

Install config files at https://github.com/lhanson/Linux-Configuration.

## Auto login to X

Xorg should start on boot and you should be automatically logged into your
window manager via the `xinit-login` systemd service. It might be a good
idea to start the WM with a lockscreen as there would otherwise be
no authentication.
