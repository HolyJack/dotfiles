#!/usr/bin/env zsh

set -e

# dependecies:
# - stow
# - nvim
# - kitty
# - zsh
# - wallust
# - waybar
# - git

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="bin,git,kitty,nvim,rofi,wallust,waybar,zsh"
fi


STOW_FOLDERS=$STOW_FOLDERS DOTFILES=$DOTFILES $DOTFILES/install.sh
