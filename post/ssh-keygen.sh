#!/bin/bash

. common.sh
spip-echo "comment="
read comment
mkdir ~/.ssh
ssh-keygen -t rsa -b 4096 -C "$comment" -f ~/.ssh/id_rsa -N ""
