#!/bin/bash

# mimic a non-reparenting window manager for Java applications
wmname LG3D

## Set root window colour
hsetroot -solid "#333333" &

## Start background services
redshift-gtk &
nm-applet &

if [[ -f $HOME/.config/awesome/rc-debian.lua ]]
then
    config="--config $HOME/.config/awesome/rc-debian.lua"
fi

if [[ -f /etc/debian_version ]]
then
    version=$(awk -F . '{print $1}' /etc/debian_version)
    if [[ -f "$HOME/.config/awesome/rc-debian-${version}.lua" ]]
    then
        config="--config $HOME/.config/awesome/rc-debian-${version}.lua"
    fi
fi

exec awesome $config >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
