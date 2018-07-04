sudo apt-get update

sudo apt install curl git wget npm -y

# Install Chrome Sources
sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

## VS Code
sudo add-apt-repository -y "deb https://packages.microsoft.com/repos/vscode stable main"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF

# Update and install files
sudo apt update
sudo apt-get -y install code google-chrome-stable

# Install Dropbox. Is there a Better way?
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
sudo apt-get install -o Acquire::ForceIPv4=true gdebi
sudo gdebi dropbox_2015.10.28_amd64.deb -o Acquire::ForceIPv4=true

# Updating nodejs
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

# Teams:
https://github.com/leftstick/teams-ubuntu
