#!/usr/bin/env bash

dotfiles_dir=$(pwd)

function link_dotfile {
  dest="${HOME}/.${1}"
  timestamp=$(date +%Y-%m-%d-%H%M)

  if [ -h "${HOME}/${1}" ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm "${dest}"

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv "${dest}" "${dest}.${timestamp}"

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv "${dest}" "${dest}.${timestamp}"
  fi

  echo "Creating new symlink: ${dest}"
  ln -sf "${dotfiles_dir}/${1}" "${dest}"
}

link_dotfile config/awesome
link_dotfile config/spectrwm
link_dotfile bashrc
link_dotfile gitconfig
link_dotfile gitignore
link_dotfile profile
link_dotfile Xmodmap
link_dotfile Xresources

link_dotfile xinitrc
ln -sf "${HOME}/.xinitrc" "${HOME}/.xsession"
ln -sf "${HOME}/.xinitrc" "${HOME}/.xprofile"

link_dotfile vim
vim +PlugInstall +qall
