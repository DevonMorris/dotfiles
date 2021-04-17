#!/usr/bin/env bash
# It should be as easy as running this setup file
# You'll probably need to change the remote to be able to push properly
git clone --bare https://gitlab.com/DevonMorris/dotfiles.git $HOME/.dots
function dots {
   /usr/bin/env git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
dots reset --hard HEAD
dots config status.showUntrackedFiles no

ln -sf "$PWD/scripts" "$HOME/.local/bin/scripts"
