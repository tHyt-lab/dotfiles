#!/bin/bash
# Entry point for a fresh Mac:
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tHyt-lab/dotfiles/main/bootstrap.sh)"
set -eu

# Defined and called on the last line so a truncated download never runs partially.
main() {
	DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

	# git on a fresh Mac is a stub that opens the Command Line Tools dialog, so Homebrew (whose installer provides the tools) goes first.
	if [ ! -x /opt/homebrew/bin/brew ]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	if [ ! -d "$DOTFILES_DIR/.git" ]; then
		git clone https://github.com/tHyt-lab/dotfiles.git "$DOTFILES_DIR"
	fi

	cd "$DOTFILES_DIR"
	./setup.sh
}

main "$@"
