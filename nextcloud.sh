#!/bin/bash

# Changement du depot de package
echo "# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://fr.archive.ubuntu.com/ubuntu jammy main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://fr.archive.ubuntu.com/ubuntu jammy-updates main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://fr.archive.ubuntu.com/ubuntu jammy universe
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy universe
deb http://fr.archive.ubuntu.com/ubuntu jammy-updates universe
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://fr.archive.ubuntu.com/ubuntu jammy multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy multiverse
deb http://fr.archive.ubuntu.com/ubuntu jammy-updates multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://fr.archive.ubuntu.com/ubuntu jammy-backports main restricted universe                                                                                                                                                              multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-backports main restricted un                                                                                                                                                         iverse multiverse

deb http://fr.archive.ubuntu.com/ubuntu jammy-security main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-security main restricted
deb http://fr.archive.ubuntu.com/ubuntu jammy-security universe
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-security universe
deb http://fr.archive.ubuntu.com/ubuntu jammy-security multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu jammy-security multiverse" > /etc/apt/sources.list

apt update
apt upgrade
apt-get update

#Solution NGINX
apt install nginx

#Installation de paquets supplémentaires
apt install nano
apt install zip
apt install unzip
apt install rar
apt install unrar
apt install bash-completion
apt install tree
apt install net-tools
apt install curl
apt install openssl
apt install fonts-dejavu
apt install fonts-liberation2
apt install fonts-crosextra-caladea
apt install fonts-crosextra-carlito
apt-get install ttf-mscorefonts-installer
apt-get install p7zip*

#Date et heure
timedatectl set-timezone Europe/Paris

#Solution PHP
apt-get install php-zip php-dom php-xml php-mbstring php-gd php-curl php-cli php8.1-fpm