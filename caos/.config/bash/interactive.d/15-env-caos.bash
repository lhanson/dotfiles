################################################################################
# caos.bash - configuration for working on CAOS
################################################################################

# CAOS figures out its own environment variables
if [[ -f /chub/conf/environment ]]; then
	source /chub/conf/environment > /dev/null
fi
