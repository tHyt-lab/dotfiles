#!/bin/bash
set -eu

# Homebrew's installer also installs the Command Line Tools when they are missing.
if [ ! -x /opt/homebrew/bin/brew ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Guarded so re-runs don't append duplicate lines.
if ! grep -qs 'brew shellenv' "$HOME/.zprofile"; then
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> "$HOME/.zprofile"
fi
