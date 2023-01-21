#!/usr/bin/env bash
# It should be as easy as running this setup file
# You'll probably need to change the remote to be able to push properly
# Requires git and stow to work properly

if ! command -v git &> /dev/null
then
  echo "Please install git"
  exit
fi

if ! command -v stow &> /dev/null
then
  echo "Please install stow"
  exit
fi

git clone https://gitlab.com/DevonMorris/dotfiles.git $HOME/.dots
cd $HOME/.dots && stow -vvv -t $HOME --adopt .
