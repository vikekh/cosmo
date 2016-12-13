#!/bin/bash

function spip-echo {
    echo "spip: $1"
}

spip-echo "Hello!"
release="$(lsb_release -i -s) $(lsb_release -r -s)"
release=${release,,}
release=${release// /-}
spip-echo "Adding $release repositories..."

if [ -d "sources/$release" ]
then
    for file in "sources/$release/*.sh"
    do
        sudo chmod +x $file
        sudo "./$file"
    done
fi

spip-echo "Done adding repositories."
spip-echo "Installing packages..."
packages="$(xargs printf ' %s' < packages | cut -b 2-)"
sudo apt-get update && sudo apt-get install -y $packages
spip-echo "Done installing packages."

if [ command -v php >/dev/null 2>&1 ]
then
    spip-echo "Installing php packages..."
    
    for file in post/php*.sh
    do
        sudo chmod +x $file
        sudo "./$file"
    done
    
    spip-echo "Done installing php packages."
else
    spip-echo "php is not installed."
fi

if [ command -v npm >/dev/null 2>&1 ]
then
    spip-echo "Installing npm packages..."
    
    for file in post/npm*.sh
    do
        sudo chmod +x $file
        sudo "./$file"
    done
    
    spip-echo "Done installing npm packages."
else
    spip-echo "npm is not installed."
fi

spip-echo "Bye bye!"
