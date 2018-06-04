# Video

What graphics card is installed on my system? Try `lspci | grep VGA` to list
devices, or check Xorg.0.log to see what modules loaded. See what modules are loaded
with `lsmod`, note 'nv' for NVIDIA, etc.

## ThinkPad T440p

The ThinkPad has an integraded Intel HD Graphics 4600, and the dedicated
graphics chip is a NVIDIA GK208M (GeForce GT 730M, rev a1).

### Xorg Modules

Xorg loads modules `exa`, `glx`, `fb`, `intel`, `libinput`, `nouveau`,
`modesetting`, `shadowfb`, `synaptics`.

It reports that it can't open `modesetting`, `nv`, `fbdev`, `vesa`

Also shows: `Unable to get master: Permission denied`.
