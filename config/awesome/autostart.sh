#!/bin/bash

# mimic a non-reparenting window manager for Java applications
wmname LG3D

## Set root window colour
hsetroot -solid "#333333" &

## Start background services
redshift-gtk &
nm-applet &

# detect distribution & version specific configs, mostly for backward-compatibility
if [[ -r /etc/os-release ]]
then
    source <(sed 's/ /_/g' /etc/os-release)
    if [[ -r "$HOME/.config/awesome/rc-${ID}-${VERSION_ID}.lua" ]]
    then
        config="--config $HOME/.config/awesome/rc-${ID}-${VERSION_ID}.lua"
    fi
fi

# set default rc.lua as fallback (should be symlink to the most recent config)
if [[ -r $HOME/.config/awesome/rc.lua ]]
then
    config="--config $HOME/.config/awesome/rc.lua"
fi

exec awesome $config >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
