#!/usr/bin/env bash

# shellcheck disable=SC1091

set -euo pipefail
shopt -s nullglob

# $USER
if [[ "$(uname)" = 'Darwin' ]]; then
	logged_in_user=$(echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ {print $3}')
elif [[ "$(uname)" = 'Linux' ]]; then
	[[ -n $(logname >/dev/null 2>&1) ]] && logged_in_user=$(logname) || logged_in_user=$(whoami)
else
	echo "Unknown OS: $(uname). Exiting..."
	exit 1
fi

# $UID
# logged_in_uid=$(id -u "${logged_in_user}")

# $HOME
logged_in_home=$(eval echo "~${logged_in_user}")

# Source ~/.bashrc
. "${logged_in_home}/.bashrc"

if [[ $TERM == "xterm-ghostty" ]] || [[ $TERM = "xterm-256color" ]]; then
	exec "$SHELL" -li -c "bash" "fastfetch -c ${logged_in_home}/.config/fastfetch.jsonc"
fi
