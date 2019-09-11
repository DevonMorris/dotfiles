#!/usr/bin/env bash
# It should be as easy as running this setup file
# Note: You will need to generate ssh keys and add them to github first
# or if you are not me you will need to change the link to https
git clone --bare https://gitlab.com/DevonMorris/dotfiles.git $HOME/.dots
function config {
   /usr/bin/env git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
config reset --hard HEAD
config config status.showUntrackedFiles no
