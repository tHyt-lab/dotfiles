#!/bin/sh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# keyboard
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g com.apple.keyboard.fnState -bool true
defaults write -g ApplePressAndHoldEnabled -bool true

# Trackpad
defaults write -g com.apple.trackpad.scaling -float 1.5

defaults write -g AppleEnableMouseSwipeNavigateWithScrolls -bool true
defaults write -g com.apple.mouse.scaling -int 2

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton"

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

# appearance mode
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

# Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Finder
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 32" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 16" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 11" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

killall Finder &> /dev/null

# Dock
# icon size
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock largesize -int 70
# Hide recently used applications
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock magnification -bool true
killall Dock &> /dev/null

# Do not allow .DS_Store files to be created
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Clock
defaults write com.apple.menuextra.clock DateFormat -string "M\\U6708d\\U65e5(EEE)  H:mm:ss"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowDate -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool true

defaults write com.apple.rapport familySyncedName -string "Mac"

killall SystemUIServer &> /dev/null

