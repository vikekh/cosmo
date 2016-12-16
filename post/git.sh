#!/bin/bash

spip-echo "git email:"
read git-email
spip-echo "git name:"
read git-name
ssh-keygen -t rsa -b 4096 -C "$git-email" -f ~/.ssh/id_rsa -N ""
git config --global core.editor vim
git config --global user.email "$git-email"
git config --global user.name "$git-name"
