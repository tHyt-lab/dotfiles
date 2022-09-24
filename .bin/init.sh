#!/bin/bash

# Install xcode
xcode-select --install

# Install brew
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"