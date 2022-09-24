#!/bin/bash

# Set initial preference.
./.bin/init.sh

# Link dotfiles.
./.bin/link.sh

# Install macOS applications.
./.bin/brew.sh

# Set macOS system preferences.
./.bin/defaults.sh

# Install Fonts
./.bin/font-install.sh

exec $SHELL -l