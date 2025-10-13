#!/bin/bash

# Set initial preference.
cat << EOF

##################################################
  Set initial preference.
##################################################

EOF
./scripts/init.sh

# Install Oh My Zsh and plugins.
cat << EOF

##################################################
  Install Oh My Zsh and plugins.
##################################################

EOF
./zsh/setup.sh

# Link dotfiles.
cat << EOF

##################################################
  Link dotfiles.
##################################################

EOF
./scripts/link.sh

# Install macOS applications.
cat << EOF

##################################################
  Install macOS applications.
##################################################

EOF
./homebrew/setup.sh

# Set macOS system preferences.
cat << EOF

##################################################
  Set macOS system preferences.
##################################################

EOF
./scripts/defaults.sh

# Install Fonts
cat << EOF

##################################################
  Install Fonts
##################################################

EOF
./scripts/font-install.sh

cat << EOF

############################################################
  Complete.
  Please restart your PC for the settings to take effect.
############################################################

EOF

exec $SHELL -l