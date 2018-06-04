# Arch on a Macbook Pro

I'm running the `linux-macbook` kernel package.

## Built-in keyboard and trackpad don't work

Install the [macbook12-spi-driver-dkms](https://github.com/cb22/macbook12-spi-driver)
AUR package, then add `applespi` to the "MODULES" section of `/etc/mkinitcpio.conf`.
Run `mkinitcpio -P` to regenerate the initial RAM fs and reboot.
