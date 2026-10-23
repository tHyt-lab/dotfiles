#!/bin/sh
set -eu

# Absolute path: ~/.local/bin is not on PATH in non-interactive runs.
MISE="$HOME/.local/bin/mise"

if [ ! -x "$MISE" ]; then
	curl -fsSL https://mise.run | sh
fi

"$MISE" install
