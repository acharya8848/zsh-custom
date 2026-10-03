# Dictionary of writeback excluded aliases
typeset -A NO_WRITEBACK_ALIASES
NO_WRITEBACK_ALIASES[ls]="1"
NO_WRITEBACK_ALIASES[cd]="1"

# Hook to do things before commands execute
# If you need to sign a contract with the devil to make this run faster, DO IT!
preexec() {
	# Pull out the first word in the command
	commandfirstword=${1%% *}

	# If we're about to run an alias, print it to the screen first
	if [[ -n "$aliases[$commandfirstword]" && -z "$NO_WRITEBACK_ALIASES[$commandfirstword]" ]]; then
		# $2 is size limited while $3 is the full text
		print -r -P -- "%F{green}> $3%f"
	fi
}
