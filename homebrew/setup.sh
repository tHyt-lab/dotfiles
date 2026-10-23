#!/bin/sh
set -eu

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# PATH has no Homebrew in a fresh non-login shell.
eval "$(/opt/homebrew/bin/brew shellenv)"

# --no-upgrade keeps re-runs from changing versions of already installed packages.
brew bundle install --no-upgrade --file "${SCRIPT_DIR}/Brewfile"
