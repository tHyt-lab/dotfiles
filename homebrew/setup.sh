#!/bin/sh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

which brew >/dev/null 2>&1 && brew doctor
which brew >/dev/null 2>&1 && brew update --verbose
which brew >/dev/null 2>&1 && brew upgrade --verbose

which brew >/dev/null 2>&1 && brew bundle --file "${SCRIPT_DIR}/Brewfile" --verbose
which brew >/dev/null 2>&1 && brew cleanup --verbose