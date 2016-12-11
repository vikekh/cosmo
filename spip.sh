#!/bin/bash

for file in /sources/*.sh
do
    sudo chmod +x $file
    sudo "./$file"
done

packages="$(xargs printf ' %s' < packages | cut -b 2-)"
sudo apt-get update && sudo apt-get install -y $packages

if command -v php >/dev/null 2>&1
then
    for file in /post/php*.sh
    do
        sudo chmod +x $file
        sudo "./$file"
    done
fi

if command -v npm >/dev/null 2>&1
then
    for file in /post/npm*.sh
    do
        sudo chmod +x $file
        sudo "./$file"
    done
fi
