#!/bin/bash

spip-echo "git demands your e-mail address:"
read git_email
spip-echo "git demands your name:"
read git_name
ssh-keygen -t rsa -b 4096 -C "$git_email" -f ~/.ssh/id_rsa -N ""
git config --global core.editor vim
git config --global user.email "$git_email"
git config --global user.name "$git_name"
