# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=100000

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s cdspell
shopt -s dirspell
shopt -s cmdhist
shopt -s extglob
shopt -s expand_aliases

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

complete -cf sudo

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

color_bash () {
    local NONE="\[\033[0m\]"

    # regular colors
    local K="\[\033[0;30m\]"     # black
    local R="\[\033[0;31m\]"     # red
    local G="\[\033[0;32m\]"     # green
    local Y="\[\033[0;33m\]"     # yellow
    local B="\[\033[0;34m\]"     # blue
    local M="\[\033[0;35m\]"     # magenta
    local C="\[\033[0;36m\]"     # cyan
    local W="\[\033[0;37m\]"     # white
    local O="\[\033[38;5;214m\]" # orange http://misc.flogisoft.com/bash/tip_colors_and_formatting

    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"

    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"

    local host=$(hostname -s)
    case $host in
        "moobar") color=$O ;;
        "bender") color=$EMY ;;
        "zalbo")  color=$EMB ;;
        "hack")   color=$EMK ;;
        "rpi")    color=$EMG ;;
        *)        color=$EMC ;;
    esac

    export PS1="${debian_chroot:+($debian_chroot)}${O}\u${NONE}@${color}\h${NONE} \W${O} ${NONE}\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"${EMM}(BRANCH)${NONE} \")$ "
}

if which tput > /dev/null 2>&1 && [[ $(tput -T$TERM colors) -ge 8 ]]
then
    color_bash
fi

# Aliases
# Source Bash aliases, if they are in a separate file
if [ -r ~/.bash_alias ]
then
    source ~/.bash_alias
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --time-style=long-iso'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias l='ls -1'
alias ll='ls -l'
alias cp="cp -i"
alias rm='rm -i'
alias mv='mv -i'
alias df='df -hP'
alias more=less
alias free='free -m'
alias findbigfiles="find . -type f -printf '%s\t\"%p\"\n' | sort -n"
alias emacs='emacs -nw'
alias kazam='kazam --nosound'
alias abook="abook --datafile /home/skoenig/workspace/scripts/configs/mail/addressbook"
alias mplay="sudo mplayer -vo fbdev2 -xy 1280 -zoom -fs "
alias password="apg -n 1 -a 0 -m 15 -x 15"
alias pycharm='wmname LG3D; /usr/local/bin/pycharm'
alias translate="grep -hwi /usr/share/dict/de-en.txt /usr/share/trans/de-en -e"
alias trash='trash-put'
alias wakehack='wakeonlan 00:23:54:2f:2e:a5'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "state|time\ to|percentage"'
alias feh='feh --force-aliasing --scale-down '
alias sakura='sakura --working-directory ~/.config/sakura'
alias dockerclean="docker images | awk '/^<none>/ {print \$3}' | xargs -r docker rmi"
alias whatthecommit="curl -s http://whatthecommit.com/index.txt"

# mpc aliases
alias mpc='mpc --format "%position% %artist%\t\t%album%\t\t%track%. %title%" '
mpc_save () {
    mpc save $(date +%F_%H-%M)
}

mpc_addsong  () {
    mpc search any "$*" | mpc add
}

mpc_addrandom () {
    mpc listall | sed -n $[RANDOM % $(mpc stats | grep Songs | awk '{print $2}')+1]p | mpc add
}

mpc_jump () {
    mpc playlist | grep -i "$*" | grep -o '^[0-9]\+' | head -1 | xargs mpc play
}

cheat.sh () {
    curl -m 3 "http://cheat.sh/$1";
}

pullrequest () {
    #hub pull-request -o -m $(git rev-parse --abbrev-ref HEAD)
    git push -u origin HEAD
    gh pr create --fill --web
}

commitagain () {
    git commit -c `git log -1 --format=%H "$@"` "$@"
}

# shellcheck disable=SC2015,SC2164
fcd () { [ -f "$1" ] && { cd "$(dirname "$1")"; } || { cd "$1"; }; pwd; }

gch () { git checkout "$(git branch --all | fzf | tr -d '[:space:]')"; }

asc () {
    ssh -t "$@" 'screen -DRU'
}

svg2eps () {
    for file in *svg
    do
        if [ ! -f "${file/svg/eps}" ]
        then
            inkscape --without-gui --file="${file}" --export-eps="${file/svg/eps}" --export-dpi=300 --export-ignore-filters --export-ps-level=3
        fi
    done
}

svg2png() {
    for file in *svg
    do
        if [ ! -f "${file/svg/png}" ]
        then
            inkscape --without-gui --file="${file}" --export-png="${file/svg/png}" --export-dpi=300 --export-ignore-filters --export-ps-level=3
        fi
    done
}

shirts () {
    source /etc/shirts
    cd $PROJECT_ROOT
}

# Switch colorscheme depending on the time of the day.
hour=$(date +%H)
if [[ ${hour#0} -ge 8 && ${hour#0} -le 15 ]]
then
  background=2
else
  background=1
fi
sed -i "s|last_colorset=.*\$|last_colorset=$background|" ~/.config/sakura/sakura.conf

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -x /usr/bin/xmodmap ] && [ -f ~/.Xmodmap ] && [ ${#DISPLAY} -ne 0 ] && /usr/bin/xmodmap ~/.Xmodmap

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/skoenig/bin/google-cloud-sdk/path.bash.inc' ]; then . '/home/skoenig/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/skoenig/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/home/skoenig/bin/google-cloud-sdk/completion.bash.inc'; fi

# kubectl sugar
command -v "kubectl" &>/dev/null && source <(kubectl completion bash)
alias k='/usr/local/bin/kubectl '
complete -F __start_kubectl k

# kubectx and kubens
export PATH=~/.kubectx:$PATH
