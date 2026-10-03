# GitHub clone using git
function ghgitclone() {
  # Make sure the repository was given
  if [ -z "$1" ]; then
    echo "Please give the repository to clone as the argument."
    exit
  fi

  # Make sure the given repository ends with .git
  repository=$1
  if ! [[ "$repository" =~ ^.*\.git$ ]]; then
    repository="$repository.git"
  fi

  git clone git@github.com:$repository
}

# Center text in terminal
function center() {
  local line
  local columns="$(tput cols)"
  while IFS= read -r line; do
    local len=${#line}
    printf "%*s\n" $(((columns + len) / 2)) "$line"
  done
}

# Prepends sudo to the last command and writes it to the buffer
function feck() {
  local newCmd
  newCmd="sudo $(fc -ln -1)"

  writevt /proc/$$/fd/0 $newCmd
}

# Logout bifrucation
function logout() {
  if [[ "$DESKTOP_SESSION" == "niri" ]]; then
    # If we're under niri, target the shutdown service for it
    systemctl --user start niri-shutdown.target
  else
    # If we're not, then redirect to the builtin
    builtin logout
  fi
}

# A function named sudo that executes doas, if not already root
function sudo() {
  # Current user
  local user=$(whoami)

  # CLI parsing (with white-space trimming from front and the back)
  local execcommand="${${${argv[1]}## #}%% #}"
  local args="${${${argv[2,-1]}## #}%% #}"

  # If we're already running as root, simply invoke the command
  if [[ "$USER" = "root" ]]; then
    if [[ -z "${args[@]}" ]]; then
      eval "$execcommand"
    else
      eval "$execcommand ${args[@]}"
    fi
  else
    eval "doas ${argv[@]}"
  fi
}

# # Search for a package
# function search() {
#   # Constants
#   local YAY="/bin/yay"
#   local YAY_ARGS=( "-Ss" )
#   local PACMAN="/bin/pacman"
#   local PACMAN_ARGS=("-Ss")
#
#   # Switches
#   local AUR_PKGMGR="$YAY"
#   local AUR_PKGMGR_ARGS=( "${(@)YAY_ARGS}" )
#
#   # Pull the arguments out
#   local args="${${${argv[1,-1]}## #}%% #}"
#
#   # Official repos
#   local PACMAN_CMD="$PACMAN ${PACMAN_ARGS[@]} ${args[@]}"
#   echo "Official ($PACMAN_CMD):"
#   eval "$PACMAN_CMD"
#
#   # AUR
#   local AUR_CMD="$AUR_PKGMGR ${AUR_PKGMGR_ARGS[@]} ${args[@]}"
#   echo "AUR ($AUR_CMD):"
#   eval "$AUR_CMD"
# }

function waitforniri() {
  # Parameters
  local EVENT_TO_WAIT_FOR="$1"

  # Check niri output stream continuously until the event is detected
  niri msg --json event-stream | while read -r line; do
    jq "$line"
  done
}
