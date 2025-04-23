#!/bin/sh
# shellcheck disable=SC2086
#
# ~/.xinitrc
# ln -s ~/.xinitrc ~/.xsession
# ln -s ~/.xinitrc ~/.xprofile

## 250 ms delay and 25 cps (characters per second) repeat rate.
xset r rate 250 25

## Turn on/off system beep
xset b off
xset b 0 0 0

## turn off display blankening
xset s off
xset -dpms

## x keyboard layout
setxkbmap us

## have default mouse cursor theme at least in root window
xsetroot -cursor_name left_ptr &

[ -f ~/.Xmodmap ] && /usr/bin/xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

## GNOME PolicyKit and Keyring
# shellcheck disable=SC2046
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

## Set root window colour
hsetroot -solid "#333333" &

## Start background services
redshift-gtk &
nm-applet &
cbatticon --critical-level 15 --command-critical-level "sudo pm-suspend" &

# detect distribution for version-specific awesomewm configs, mostly for backward-compatibility
if [ -r /etc/os-release ]
then
    . /etc/os-release
    if [ -r "$HOME/.config/awesome/rc-${ID}-${VERSION_ID}.lua" ]
    then
        config="--config $HOME/.config/awesome/rc-${ID}-${VERSION_ID}.lua"
    fi
fi

# set default rc.lua as fallback (should be symlink to the most recent config)
if [ -r $HOME/.config/awesome/rc.lua ]
then
    config="--config $HOME/.config/awesome/rc.lua"
fi
exec awesome $config >> "$HOME/.cache/awesome/stdout" 2>> "$HOME/.cache/awesome/stderr"
