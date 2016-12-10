#!/bin/bash

sudo ./sources.sh
packages="$(xargs printf ' %s' < packages | cut -b 2-)"
sudo apt-get update && sudo apt-get install -y $packages

if [-x "$(command -v php)"]; then
    sudo ./composer.sh
fi

if [-x "$(command -v npm)"]; then
    sudo ./npm.sh
fi
