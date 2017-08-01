#!/bin/bash

# mimic a non-reparenting window manager for Java applications
wmname LG3D

## Set root window colour
hsetroot -solid "#333333" &
feh --bg-fill ~/graphic/wallpapers/nature/nature_190.png &

## GNOME PolicyKit authentication
## this may be also needed by nm-applet
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

if [[ -f /etc/debian_version && -f $HOME/.config/awesome/rc.lua-debian ]]
then
    config="--config $HOME/.config/awesome/rc.lua-debian"
    if [[ $(cat /etc/debian_version) == 9.* ]]
    then
        config="$config-new"
    fi
fi
## ck-launch-session: nm-applet needs this to run w/h root privileges + installed gksu
#exec ck-launch-session awesome $config >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
exec awesome $config >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
