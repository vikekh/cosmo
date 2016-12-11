#!/bin/bash

sudo chmod +x sources.sh
sudo ./sources.sh
packages="$(xargs printf ' %s' < packages | cut -b 2-)"
sudo apt-get update && sudo apt-get install -y $packages

if [-x "$(command -v php)"]; then
    sudo chmod +x composer.sh
    sudo ./composer.sh
fi

if [-x "$(command -v npm)"]; then
    sudo chmod +x npm.sh
    sudo ./npm.sh
fi
