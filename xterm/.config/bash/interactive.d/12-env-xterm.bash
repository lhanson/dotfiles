################################################################################
# env-xterm.bash - environment variables for Xterm
################################################################################

# Enable automatic transparency if transset-df is installed
command -v transset-df > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
	[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null
fi
