#!/usr/bin/env bash
# It should be as easy as running this setup file
# You'll probably need to change the remote to be able to push properly
git clone --bare https://gitlab.com/DevonMorris/dotfiles.git $HOME/.dots
function config {
   /usr/bin/env git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
config reset --hard HEAD
config config status.showUntrackedFiles no
