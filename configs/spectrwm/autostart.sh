#!/bin/bash

# mimic a non-reparenting window manager for Java applications
wmname LG3D

## Set root window colour
hsetroot -solid "#333333" &
feh --bg-fill ~/graphic/wallpapers/nature/nature_190.png &

## this may be also needed by nm-applet
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

## Start daemons
~/.dropbox-dist/dropboxd &
trayer --edge top --align left --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint 0x333333 --height 16 --width 4 &

cd ~

## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
#eval $(ssh-agent -s)
#export SSH_AUTH_SOCK SSH_AGENT_PID

exec spectrwm
