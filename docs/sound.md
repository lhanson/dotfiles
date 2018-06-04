# Sound

The audio system I'm using is [PulseAudio](https://wiki.archlinux.org/index.php/PulseAudio)
as the sound server middleware, with ALSA underneath..

If audio doesn't work, (try `aplay test.wav` with a suitable test file), it may
be the case that ALSA is using the wrong sound card by default. For example, on
my Lenovo T440p doesn't default to a default mixer (run `amixer`) of `Master`
like much of the documentation is geared toward, it has `IEC958` instead.
Furthermore, `alsamixer` defaulted to a "HDA Intel HDMI" card, but what I really
want to be the default is "HDA Intel PCH". Instruct ALSA to prefer card 1 by
setting `defaults.pcm.card 1` in `/usr/share/alsa/alsa.conf` or its
user-specific equivalent in `~/.asoundrc`.

If you get "No such file or directory" or "cannot find card '1'" type errors from
ALSA lib, it's likely because the login session is wonky due to not using a
display manager and booting X directly as a user; try adding the user to the
'audio' group.
