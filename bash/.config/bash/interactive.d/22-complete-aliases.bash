################################################################################
# complete-aliases.bash - Specify aliases to be subject to shell completion.
#
# Depends on complete-alias per https://github.com/cykerway/complete-alias
# (defined in 21-alias-completion.bash).

# Execution of specific alias completion follows in a different file.
################################################################################

# git
complete -F _complete_alias g
