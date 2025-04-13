# skoenigs dotfiles

<p align="center">
  <img src="https://github.com/skoenig/dotfiles/blob/main/icon.png?raw=true" alt="dotfiles logo"/>
  <br />
  <i>Crafting a digital home, one dotfile at a time.</i>
</p>

This dotfiles repo contains configurations and customizations for bash, awesomewm, vim, git and some other tools I use frequently. YMMV.

## Installation

```sh
git clone https://github.com/skoenig/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

This will symlink the appropriate files in `~/.dotfiles` to your home directory.

After this, initilize the submodules that contain awesomewm extras:

```sh
git submodule init
gut submodule update
```
