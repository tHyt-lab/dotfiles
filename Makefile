# Do everything.
all: init omz link brew defaults fonts

# Set initial preference.
init:
	scripts/init.sh

# Install Oh My Zsh and plugins.
omz:
	zsh/setup.sh

# Link dotfiles.
link:
	scripts/link.sh

# Install macOS applications.
brew:
	homebrew/setup.sh

# Set macOS system preferences.
defaults:
	scripts/defaults.sh

# Install fonts.
fonts:
	scripts/font-install.sh