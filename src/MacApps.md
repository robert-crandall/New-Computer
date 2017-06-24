# https://github.com/Homebrew/brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Find apps at http://caskroom.io/search
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install dropbox
brew cask install handbrake
brew cast install vlc

# Needs reboot
brew cask install chrome-remote-desktop-host # (needs a reboot afterwards)

brew cask install lastpass #(Then install the addin manually - /opt/homebrew-cask/Caskroom/lastpass/latest/)

#Update apps:
brew update; brew cleanup; brew cask cleanup



# Move Documents to Dropbox
sudo rm -rf ~/Documents
ln -s ~/Dropbox/Documents ~/Documents

# Move iTunes backups to spare drive
cd ~/Library/Application\ Support/MobileSync
rm -R Backup
#mkdir /Volumes/Media/MobileSync/Backup # Do this if the folder doesn’t exist
ln -s /Volumes/Media/MobileSync/Backup ~/Library/Application\ Support/MobileSync/Backup

# Also needed
# Java - might work, check later
