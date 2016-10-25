#!/bin/bash
# Monitors IO devices and enables Karabiner to remap keys as appropriate
# Adapted from https://github.com/tekezo/Karabiner-Elements/issues/67

karabiner_dir="$HOME/.karabiner.d/configuration"
karabiner_conf="$karabiner_dir/karabiner.json"
# HHKB Professional
productID='256'


function conf_enabled() {
	grep -q 'true' "$karabiner_conf"
}

while true; do
	if [[ `ioreg -p IOUSB -l -w 0 | grep -qi "\"idProduct\" = $productId$"` == 0 ]]; then
		# HHKB gets mappings right, no need to remap. Disable Karabiner profile.
		if conf_enabled; then
			sed -i '' 's/true/false/g' "$karabiner_conf"
			osascript -e "display notification \"Karabiner has been disabled\" with title \"Karabiner Elements\"" 2>/dev/null
		fi
	else
		# Default keyboard being used, remap.
		if ! conf_enabled; then
			sed -i '' 's/false/true/g' "$karabiner_conf"
			osascript -e "display notification \"Karabiner has been enabled\" with title \"Karabiner Elements\"" 2>/dev/null
		fi
	fi
	sleep 5
done
