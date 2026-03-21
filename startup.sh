#!/bin/sh

if [ "$TERM" = "xterm-ghostty" ] || [ "$TERM" = "xterm-256color" ]; then
	[ -x /opt/homebrew/bin/fastfetch ] && /opt/homebrew/bin/fastfetch -c "$HOME/.config/fastfetch.jsonc"
fi

exec "$SHELL" -l
