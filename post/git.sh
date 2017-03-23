#!/bin/bash

. common.sh
spip-echo "core.editor="
read core_editor
spip-echo "user.email="
read user_email
spip-echo "user.name="
read user_name
git config --global core.editor "$core_editor"
git config --global user.email "$user_email"
git config --global user.name "$user_name"
