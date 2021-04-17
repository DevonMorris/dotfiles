#!/usr/bin/env bash
# It should be as easy as running this setup file
# You'll probably need to change the remote to be able to push properly
git clone --bare https://gitlab.com/DevonMorris/dotfiles.git $HOME/.dots
function dots {
   /usr/bin/env git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
mkdir -p $HOME/.dots-bak
dots checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files.";
    dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dots-bak/{}
fi;
dots checkout
dots config status.showUntrackedFiles no

# Symlink scripts so that they are on path for most things
ln -sf "$PWD/scripts" "$HOME/.local/bin/scripts"
