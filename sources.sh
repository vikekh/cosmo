#!/bin/bash

# google-chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list"

# dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu xenial main"

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"

# sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
