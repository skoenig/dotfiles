# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

PATH="$HOME/.kubectx:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

EDITOR=/usr/bin/vim
BROWSER=firefox
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
JAVA_FONTS=/usr/share/fonts/TTF
PANEL_FIFO="/tmp/panel-fifo"
PANEL_HEIGHT=30
PANEL_FONT_FAMILY="*DejaVu-Sans-Mono for Powerline*"
SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export PATH EDITOR BROWSER JAVA_HOME JAVA_FONTS PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY SSL_CERT_FILE

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

if [ "$(tty)" = "/dev/tty1" ]; then
    startx
fi

