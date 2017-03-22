#!/bin/bash

. common.sh
version=$(<version)
release="$(lsb_release -i -s) $(lsb_release -r -s)"
release=${release,,}
release=${release// /-}
spip-echo "Hello! This is spip v$version."
spip-echo "Adding sources..."

for file in sources/*.sh
do
    sudo chmod +x $file
    sudo "./$file"
done

spip-echo "Done adding sources."
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
spip-echo "Running post scripts..."
    
for file in post/*.sh
do
    sudo chmod +x $file
    ./$file
done

spip-echo "Done running post scripts."
spip-echo "Running $release post scripts..."

if [ -d "post/$release" ]
then
    for file in "post/$release"/*.sh
    do
        sudo chmod +x $file
        ./$file
    done
fi

spip-echo "Done running $release post scripts."
spip-echo "Bye bye!"