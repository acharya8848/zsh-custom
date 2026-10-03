eval "$(uv generate-shell-completion zsh)"

# Don't do this when running under vim
if ! [[ "$(ps -o comm= -p $PPID)" =~ ^[gn]?vim$ ]]; then
  colorscript random
fi

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  alias nvim="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
  export EDITOR="nvim"
fi

# Universal JDK export
export _JAVA_AWT_WM_NONREPARENTING=1
