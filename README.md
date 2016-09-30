# Spip

Install script with some useful snippets below.

## Fstab

`/etc/fstab`:

    //192.168.1.100/share /media/Share cifs uid=spip,credentials=/home/spip/.credentials,iocharset=utf8,sec=ntlm 0 0

`~/.credentials`:

    username=spip
    password=spip

## Git

    ssh-keygen -t rsa -b 4096 -C cosmo@kram.er -f ~/.ssh/id_rsa -N ""

    git config --global core.editor vim
    git config --global user.email spip@example.com
    git config --global user.name spip

## LAMP

[How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04)
