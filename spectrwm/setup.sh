#!/bin/bash

current_dir=$(pwd)

sudo apt-get -y install "^libxcb*..*-dev$" feh gnome-keyring libx11-xcb-dev libxft-dev libxrandr-dev \
libxt-dev network-manager-gnome sakura scrot suckless-tools trayer xterm

cd /tmp
wget https://github.com/conformal/spectrwm/archive/SPECTRWM_2_7_2.tar.gz
tar xf SPECTRWM_2_7_2.tar.gz
cd spectrwm-SPECTRWM_2_7_2/linux/ && make
sudo make install

if [ ! -h ~/.config/spectrwm ]
then
    ln -s $(readlink -e $current_dir) ~/.config/spectrwm
fi
ln -sf ~/.config/spectrwm/spectrwm.conf ~/.spectrwm.conf
ln -sf ~/.spectrwm.conf ~/.scrotwm.conf
