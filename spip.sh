#!/bin/bash

function spip-echo {
    echo "spip: $1"
}

version=$(<version)
spip-echo "Hello! This is spip v$version."
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
    packages="$packages $(xargs printf ' %s' < packages/$release | cut -b 2-)"
fi

sudo apt-get update && sudo apt-get install -y $packages
spip-echo "Done installing packages."

if command -v git >/dev/null 2>&1
then
    spip-echo "Running git scripts..."
    
    for file in post/git*.sh
    do
        sudo chmod +x $file
        ./$file
    done
    
    spip-echo "Done running git scripts."
else
    spip-echo "git is not installed."
fi

if command -v npm >/dev/null 2>&1
then
    spip-echo "Running npm scripts..."
    
    for file in post/npm*.sh
    do
        sudo chmod +x $file
        ./$file
    done
    
    spip-echo "Done running npm scripts."
else
    spip-echo "npm is not installed."
fi

if command -v php >/dev/null 2>&1
then
    spip-echo "Running php scripts..."
    
    for file in post/php*.sh
    do
        sudo chmod +x $file
        ./$file
    done
    
    spip-echo "Done running php scripts."
else
    spip-echo "php is not installed."
fi

spip-echo "Bye bye!"
