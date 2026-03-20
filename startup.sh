#!/bin/sh

if [ "$TERM" = "xterm-ghostty" ] || [ "$TERM" = "xterm-256color" ]; then
	fastfetch -c "$HOME/.config/fastfetch.jsonc"
fi
