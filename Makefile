# Do everything.
all: init omz link mise brew defaults claude-code

# Set initial preference.
init:
	scripts/init.sh

# Install Oh My Zsh and plugins.
omz:
	zsh/setup.sh

# Link dotfiles.
link:
	scripts/link.sh

# Install tools managed by mise.
mise:
	scripts/mise.sh

# Install macOS applications.
brew:
	homebrew/setup.sh

# Set macOS system preferences.
defaults:
	scripts/defaults.sh

# Install Claude Code.
claude-code:
	scripts/claude-code.sh

# Report drift between this repo and the machine.
doctor:
	scripts/doctor.sh