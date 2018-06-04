# Input Devices

Dealing with keyboards, mice, trackpads, etc.

## Finding attached devices

`xinput` (from package `xorg-xinput`).

To see attached USB devices:
	lsusb
	# To examine a particular device number in more detail:
	lsusb -v -s 18

Device IDs from `lsusb` on my home setup:

	KBT Pure: Bus 003 Device 012: ID 04d9:0134 Holtek Semiconductor, Inc.
	Logitech mouse(?): Bus 003 Device 013: ID 046d:c52b Logitech, Inc. Unifying Receiver

## Remapping keys

Writing HWDB rules rules is a handy way to map keys on particular input devices:

To get vendor information for writing rules, run: `xinput list`, then
`xinput list-props $DEVICE_ID`, then `udevadm info --query=property --name=/dev/input/event*`.

hwdb format:

	evdev:input:b<bus_id>v<vendor_id>p<product_id>e<version_id>-<modalias>

## Setting natural scroll direction for external mice

Set 'Option "NaturalScrolling" "true"' in `/etc/X11/xorg.conf.d/xx-mice.conf`.

## udev

We use `udev` rules to match particular devices being attached or removed and
perform appropriate actions.

To monitor devices being plugged in and out:
	udevadm monitor

Get specific information on a given device:
	udevadm info -a /dev/char/1:1

## Resources

	- https://wiki.archlinux.org/index.php/X_KeyBoard_extension#Multiple_keyboards
	- https://wiki.archlinux.org/index.php/Map_scancodes_to_keycodes
	- http://www.reactivated.net/writing_udev_rules.html
	- https://unix.stackexchange.com/a/170357/7430
	- https://wiki.archlinux.org/index.php/Libinput
	- https://fedoraproject.org/wiki/Input_device_configuration
	- https://wiki.archlinux.org/index.php/Mouse_acceleration
