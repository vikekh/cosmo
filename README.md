# Spip

Dear Viktor,

This is a handy repository for you when you've f\*\*\*ed your system. Run the provided install script and consult config snippets below if need be.

Download the latest version of the script and execute it:

    wget -O ~/Downloads/spip.zip https://github.com/vikekh/spip/archive/master.zip && unzip ~/Downloads/spip.zip && rm ~/Downloads/spip.zip && mv ~/spip-master ~/spip && cd ~/spip && sudo chmod +x spip.sh && sudo ./spip.sh && cd ..

## Fstab

`/etc/fstab`:

    //192.168.1.100/share /media/Share cifs uid=spip,credentials=/home/spip/.credentials,iocharset=utf8,sec=ntlm 0 0

`~/.credentials`:

    username=spip
    password=spip

## Git

    ssh-keygen -t rsa -b 4096 -C spip@example.com -f ~/.ssh/id_rsa -N ""

    git config --global core.editor vim
    git config --global user.email spip@example.com
    git config --global user.name spip

## LAMP

[How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04)
