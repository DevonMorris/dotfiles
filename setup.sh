#!/usr/bin/env bash
# It should be as easy as running this setup file
# Note: You will need to generate ssh keys and add them to github first
# or if you are not me you will need to change the link to https
git clone --bare git@github.com:DevonMorris/dotfiles.git $HOME/.dots
function config {
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
