#!/usr/bin/env bash

# Install arch packages
sudo pacman -Syu
sudo pacman -S --needed --noconfirm < pkglistarch.txt

# check if yay exists
if ! [ -x "$(command -v yay)" ]; then
  echo 'Yay is not installed; Installing now.'
  mkdir $HOME/.sources
  git clone https://aur.archlinux.org/yay.git $HOME/.sources/yay
  pushd .
  cd $HOME/.sources/yay
  makepkg -si
  popd
fi

# install AUR packages
yay -Syu
yay -S --noconfirm < pkglistyay.txt
