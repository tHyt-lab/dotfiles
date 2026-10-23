#!/bin/sh

# Native installer is the officially recommended method and auto-updates; the Homebrew cask does not.
if [ -x "$HOME/.local/bin/claude" ]; then
	echo "Claude Code is already installed."
	exit 0
fi

curl -fsSL https://claude.ai/install.sh | bash

"$HOME/.local/bin/claude" --version
