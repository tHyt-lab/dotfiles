#!/bin/bash
set -eu

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

# Install tools managed by mise.
cat << EOF

##################################################
  Install tools managed by mise.
##################################################

EOF
./scripts/mise.sh

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

# Install Claude Code.
cat << EOF

##################################################
  Install Claude Code.
##################################################

EOF
./scripts/claude-code.sh

cat << EOF

############################################################
  Complete.
  Please restart your PC for the settings to take effect.
############################################################

EOF

exec $SHELL -l