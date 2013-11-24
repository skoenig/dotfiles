## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

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

## Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
## Adjust the values according to your preferances.
xset r rate 250 25 &

## Turn on/off system beep
xset b off &

## have default mouse cursor theme at least in root window
xsetroot -cursor_name left_ptr &

nm-applet &
pidgin &
~/.dropbox-dist/dropboxd &

cd ~
exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
