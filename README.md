# A Letter from Kramer

Dear Viktor.

This is a handy repository for you when you've reinstalled your system without taking notes on software installed and configurations made. Just run the provided shell script and use the notes below to get everything up and running in no time!

Regards,  
Cosmo

## Fstab

If I remember correctly, and I do, you want to mount the shares on your NAS. I use Jerry's NAS, first creating a directory to mount in and then simply own it.

    sudo mkdir /media/Jerry
    sudo chown cosmo /media/Jerry
    
Then I create a credentials file `~/.jerry` in my home directory with the following format:

    username=george
    password=bosco

And I specify my mount by appending `/etc/fstab`. All done then!

    //192.168.1.129/jerry /media/Jerry cifs uid=cosmo,credentials=~/.jerry,iocharset=utf8,sec=ntlm 0 0

## Git

Surely you forgot to backup your generated SSH key used by `git`. Well, just run `ssh-keygen` to generate a new one.

    ssh-keygen -t rsa -b 4096 -C cosmo@kram.er -f ~/.ssh/id_rsa -N ""

And don't forget to configure `vim` as you commit message editor. Also, please add your e-mail and name for convenience.

    git config --global core.editor vim
    git config --global user.email cosmo@kram.er
    git config --global user.name cosmo

## LAMP

I know you've been having some problems in the past with configuring the LAMP stack. I found this easy peasy lemon squeezy tutorial at [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04) that you can consult if the urge is there.

I will simplify it for you when the time is right.
