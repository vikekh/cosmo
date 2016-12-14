#!/bin/bash

function spip-echo {
    echo "spip: $1"
}

spip-echo "Hello!"
spip-echo "Adding sources..."

for file in sources/*.sh
do
    sudo chmod +x $file
    sudo "./$file"
done

spip-echo "Done adding sources."
release="$(lsb_release -i -s) $(lsb_release -r -s)"
release=${release,,}
release=${release// /-}
spip-echo "Adding $release sources..."

if [ -d "sources/$release" ]
then
    for file in "sources/$release"/*.sh
    do
        sudo chmod +x $file
        sudo "./$file"
    done
fi

spip-echo "Done adding $release sources."
spip-echo "Installing packages..."
packages="$(xargs printf ' %s' < packages/default | cut -b 2-)"

if [ -f "packages/$release" ]
then
    spip-echo "Found $release packages."
    packages="$packages $(xargs printf ' %s' < 'packages/$release' | cut -b 2-)"
fi

sudo apt-get update && sudo apt-get install -y $packages
spip-echo "Done installing packages."

if command -v php >/dev/null 2>&1
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

if command -v npm >/dev/null 2>&1
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
