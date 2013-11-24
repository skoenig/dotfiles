#!/bin/bash

current_dir=$(pwd)

sudo apt-get -y install "^libxcb*..*-dev$" feh gnome-keyring gnome-screensaver libx11-xcb-dev libxft-dev libxrandr-dev \
libxt-dev network-manager-gnome sakura scrot suckless-tools trayer xfce4-power-manager xterm

cd /tmp
wget https://github.com/conformal/spectrwm/archive/SPECTRWM_2_3_0.tar.gz
tar xf SPECTRWM_2_3_0.tar.gz
cd spectrwm-SPECTRWM_2_3_0/linux/ && make
sudo make install

ln -s $(readlink -e $current_dir) ~/.config/spectrwm
ln -sf ~/.config/spectrwm/spectrwm.conf ~/.spectrwm.conf
ln -sf ~/.spectrwm.conf ~/.scrotwm.conf
