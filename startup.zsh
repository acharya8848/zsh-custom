#fortune | cowsay | center
#fastfetch
eval "$(uv generate-shell-completion zsh)"

# Don't do this when running under vim
if ! [[ "$(ps -o comm= -p $PPID)" =~ ^[gn]?vim$ ]]; then
	colorscript random
fi
