#!/bin/bash

sudo chmod +x sources.shsu
sudo ./sources.sh
packages="$(xargs printf ' %s' < packages | cut -b 2-)"
sudo apt-get update && sudo apt-get install -y $packages

if command -v php >/dev/null 2>&1; then
    sudo ./composer.sh
fi

if command -v npm >/dev/null 2>&1; then
    sudo ./npm.sh
fi
