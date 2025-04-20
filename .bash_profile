# Set PATH variable
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"                       # Add bin
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"         # Add local bin
[ -d "$HOME/scripts" ] && PATH="$HOME/scripts:$PATH" # Add scripts

# Enviroment variables
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # Disable dotnet telemetry
export EDITOR='vim' # Set default editor

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [ -e /home/user/.nix-profile/etc/profile.d/nix.sh ]; then . /home/user/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
