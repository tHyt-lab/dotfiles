#!/bin/bash

# Set initial preference.
cat << EOF

##################################################
  Set initial preference.
##################################################

EOF
./.bin/init.sh

# Link dotfiles.
cat << EOF

##################################################
  Link dotfiles.
##################################################

EOF
./.bin/link.sh

# Install macOS applications.
cat << EOF

##################################################
  Install macOS applications.
##################################################

EOF
./.bin/brew.sh

# Set macOS system preferences.
cat << EOF

##################################################
  Set macOS system preferences.
##################################################

EOF
./.bin/defaults.sh

# Install Fonts
cat << EOF

##################################################
  Install Fonts
##################################################

EOF
./.bin/font-install.sh

cat << EOF

############################################################
  Complete.
  Please restart your PC for the settings to take effect.
############################################################

EOF

exec $SHELL -l