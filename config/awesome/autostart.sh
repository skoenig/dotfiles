#!/bin/bash

# mimic a non-reparenting window manager for Java applications
wmname LG3D

## Set root window colour
hsetroot -solid "#333333" &

## Start background services
redshift-gtk &
nm-applet &

# set default rc.lua as fallback (should be symlink to the most recent config)
if [[ -f $HOME/.config/awesome/rc.lua ]]
then
    config="--config $HOME/.config/awesome/rc.lua"
fi

# detect Debian version specific configs, mostly for downward-compatibility
if [[ -f /etc/debian_version ]]
then
    version=$(awk -F . '{print $1}' /etc/debian_version)
    if [[ -f "$HOME/.config/awesome/rc-debian-${version}.lua" ]]
    then
        config="--config $HOME/.config/awesome/rc-debian-${version}.lua"
    fi
fi

exec awesome $config >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
