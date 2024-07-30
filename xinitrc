#!/bin/bash
#
# ~/.xinitrc
# ln -s ~/.xinitrc ~/.xsession
# ln -s ~/.xinitrc ~/.xprofile

## 250 ms delay and 25 cps (characters per second) repeat rate.
xset r rate 250 25 &

## Turn on/off system beep
xset b off &

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

exec ~/.config/awesome/autostart.sh
