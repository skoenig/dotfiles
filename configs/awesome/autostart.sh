#!/bin/bash

# mimic a non-reparenting window manager for Java applications
wmname LG3D

## Set root window colour
hsetroot -solid "#333333" &
feh --bg-fill ~/graphic/wallpapers/nature/nature_190.png &

## this may be also needed by nm-applet
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

## Start daemons
#gnome-screensaver &
~/.dropbox-dist/dropboxd &

cd ~

## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

if [[ -f /etc/debian_version && -f $HOME/.config/awesome/rc.lua-debian ]]
then
    config="--config $HOME/.config/awesome/rc.lua-debian"
fi
## ck-launch-session: nm-applet needs this to run w/h root privileges + installed gksu
#exec ck-launch-session awesome $config >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
exec awesome $config >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
