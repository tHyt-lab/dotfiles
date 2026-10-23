#!/bin/sh
# Read-only: reports drift between this repo and the machine without changing anything.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
MISE="$HOME/.local/bin/mise"
status=0

while read -r src dst; do
	if [ -n "$src" ]; then
		if [ -L "$HOME/$dst" ] && [ "$(readlink "$HOME/$dst")" = "${PROJECT_ROOT}/$src" ]; then
			echo "ok:   $HOME/$dst"
		else
			echo "DIFF: $HOME/$dst is not linked to ${PROJECT_ROOT}/$src"
			status=1
		fi
	fi
done < "${SCRIPT_DIR}/links.conf"

if [ -x /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if command -v brew >/dev/null 2>&1 && brew bundle check --no-upgrade --file "${PROJECT_ROOT}/homebrew/Brewfile" >/dev/null 2>&1; then
	echo "ok:   Brewfile"
else
	echo "DIFF: Brewfile is not satisfied (see: brew bundle check --no-upgrade --file homebrew/Brewfile --verbose)"
	status=1
fi

if [ -x "$MISE" ] && [ -z "$("$MISE" ls --missing 2>/dev/null)" ]; then
	echo "ok:   mise tools"
else
	echo "DIFF: mise tools are missing (see: $MISE ls --missing)"
	status=1
fi

if [ -x "$HOME/.local/bin/claude" ]; then
	echo "ok:   claude"
else
	echo "DIFF: claude is not installed"
	status=1
fi

exit "$status"
