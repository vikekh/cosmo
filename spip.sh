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

# apt-get
sudo apt-get update && sudo apt-get install -y apache2 cifs-utils classicmenu-indicator dropbox git gksu google-chrome-stable libapache2-mod-php mysql-server nodejs nodejs-legacy npm php php-cli php-mysql rar spotify-client sublime-text texlive-full vim vlc

# composer
mkdir ~/bin
EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
then
    php composer-setup.php --install-dir=bin --filename=composer --quiet
    RESULT=$?
    rm composer-setup.php
    exit $RESULT
else
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

# npm
sudo npm install -g bower
