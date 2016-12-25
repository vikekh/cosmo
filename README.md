# Spip

Dear Viktor,

This is a handy script when you have botched your system.

    wget -O ~/Downloads/spip.zip https://github.com/vikekh/spip/archive/0.2.0.zip && unzip ~/Downloads/spip.zip && rm ~/Downloads/spip.zip && mv ~/spip-0.2.0 ~/spip && cd ~/spip && sudo chmod +x spip.sh && sudo ./spip.sh && cd ..

## Fstab

`/etc/fstab`:

    //192.168.1.100/share /media/Share cifs uid=spip,credentials=/home/spip/.credentials,iocharset=utf8,sec=ntlm 0 0

`~/.credentials`:

    username=spip
    password=spip

## LAMP

[How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04)
