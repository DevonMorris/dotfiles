#!/usr/bin/env bash

CYAN='\033[0;36m'
NC='\033[0m'

# Install Prerequisite apt packages
echo -e "${CYAN}Installing prerequsite packages${NC}"
sudo apt install feh zsh i3 i3lock git fonts-powerline wget compton pavucontrol rofi arandr ranger

# Copying .gitconfig into home directory
echo -e "${CYAN}Symlinking .gitconfig to home directory${NC}"
ln -svf `pwd`/.gitconfig $HOME/.gitconfig

# Copy vimrc into home folder
echo -e "${CYAN}Symlinking .vimrc to home directory${NC}"
ln -svf `pwd`/.vimrc $HOME/.vimrc

# Install Vundle package manager
echo -e "${CYAN}Installing Vundle package manager${NC}"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# Install monokai theme
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
mkdir -p $HOME/.vim/colors
mv monokai.vim $HOME/.vim/colors/

# Install vim plugins
vim -c PluginInstall -c q -c q

# Compile YCM with C language sematic support
echo -e "${CYAN}Compliling YCM${NC}"
pushd .
cd $HOME/.vim/bundle/YouCompleteMe
./install.py --clang-completer
popd

# Set default shell to zsh
echo -e "${CYAN}Changing shell to zsh${NC}"
chsh -s $(which zsh)

# Install Oh My Zsh
echo -e "${CYAN}Installing Oh My Zsh${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -B)"

# Copy over .zshrc
echo -e "${CYAN}Symlinking .zshrc to home directory${NC}"
ln -svf `pwd`/.zshrc $HOME/.zshrc

# Copy over wallpaper
echo -e "${CYAN}Copying Wallpaper to Pictures directory${NC}"
cp -r Pictures $HOME

# Get font awesome
echo -e "${CYAN}Installing font awesome${NC}"
wget https://github.com/FortAwesome/Font-Awesome/releases/download/5.2.0/fontawesome-free-5.2.0-desktop.zip
unzip fontawesome-free-5.2.0-desktop.zip
sudo mv fontawesome-free-5.2.0-desktop /usr/local/share/fonts

# Copy over i3 config
echo -e "${CYAN}Copying i3 Config${NC}"
i3-config-wizard
cp .config/i3/config $HOME/.config/i3/config
