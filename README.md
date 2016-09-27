# Spip

Dear Viktor.

This is a handy repository for you when you've reinstalled your system without taking notes on software installed and configurations made. Just run the provided shell script and use the notes below to get everything up and running in no time!

Regards,
Cosmo

## Git

Surely you forgot to backup your generated SSH key used by `git`. Well, just run `ssh-keygen` to generate a new one.

    ssh-keygen -t rsa -b 4096 -C cosmo@kram.er -f ~/.ssh/id_rsa -N ""

And don't forget to configure `vim` as you commit message editor. Also, please add your e-mail and name for convenience.

    git config --global core.editor vim
    git config --global user.email cosmo@kram.er
    git config --global user.name cosmo
