# First you update your system
sudo apt update && sudo apt-get dist-upgrade

# Uninstall unnecessary programs
sudo apt purge epiphany-browser epiphany-browser-data #browser
sudo apt purge pantheon-mail

# Bring back Software and Updates from Ubuntu
sudo apt-get install software-properties-gtk
# Properties Commons (to install elementary tweaks)
sudo apt install software-properties-common
# gdebi for easy click-install of *.deb
sudo apt install gdebi
#Install File Compression Libs
sudo apt install rar unrar zip unzip p7zip-full p7zip-rar
# GIT
sudo apt install git
# essential programs
sudo apt install ubuntu-restricted-extras libavcodec-extra ffmpeg

# Elementary Tweaks
## 1. adding repository
sudo add-apt-repository ppa:philip.scott/elementary-tweaks
## 2. updating apt-get
sudo apt update 
## 3. installing tweaks
sudo apt install elementary-tweaks

# KDE Connect with bluetooth enabled
# TODO

# Google Chrome
sudo apt install libxss1 libappindicator1 libindicator7
## 1. downloading last stable package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
## 2. installing package
sudo dpkg -i google-chrome-stable_current_amd64.deb
## 3. fixing broken dependencies
sudo apt install -f
## 4. Enable maximize and minimize button on Google Chrome
#gconftool-2 --set /apps/metacity/general/button_layout --type string ":minimize:maximize:close"
rm google-chrome*.deb # free up space

## Synology Drive Client
wget https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.2-10562/Ubuntu/Installer/x86_64/synology-drive-10562.x86_64.deb
sudo dpkg -i synology-drive-10562.x86_64.deb


#Reduce overheating and improve battery life
## 1. adding repository
#sudo add-apt-repository ppa:linrunner/tlp
## 2. updating apt-get
#sudo apt-get update
## 3. installing package
#sudo apt-get install tlp tlp-rdw
## 4. starting application
#sudo tlp start


# Paper theme
# add daily builds PPA
sudo add-apt-repository ppa:snwh/pulp
# update repository info
sudo apt-get update
# install icon theme
sudo apt-get install paper-icon-theme
# install cursor theme
sudo apt-get install paper-cursor-theme

# Synapse launcher
sudo apt install synapse

# Git setup
printf "Enter your name for git commits: \n"
read username
printf "Enter your email for git: \n"
read email
git config --global user.name ${username}
git config --global user.email ${email}

# Python2/3 pip
sudo apt install python3-dev python-pip python3-pip

# pip libs
#pip3 install scipy pandas numpy sympy matplotlib html5lib thefuck

# Clean up
sudo apt autoremove
sudo apt autoclean
