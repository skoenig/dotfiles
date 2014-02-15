#!/bin/bash

# mimic a non-reparenting window manager for Java applications
wmname LG3D

## Set root window colour
#hsetroot -solid "#333333" &
#feh --bg-fill ~/graphic/wallpapers/nature/nature_190.png &

## Volume keys daemon
#xfce4-volumed &

## Enable power management
#xfce4-power-manager &

## Detect and configure touchpad. See 'man synclient' for more info.
if egrep -iq 'touchpad' /proc/bus/input/devices; then
    synclient VertEdgeScroll=1 &
    synclient TapButton1=1 &
fi

## Start screensaver
gnome-screensaver &

nm-applet &
pidgin &
~/.dropbox-dist/dropboxd &

cd ~

## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
