#!/usr/bin/env bash

CYAN='\033[0;36m'
NC='\033[0m'

# Install Prerequisite apt packages
echo -e "${CYAN}Installing prerequsite packages${NC}"
sudo apt install feh zsh i3 git fonts-powerline wget compton pavucontrol

# Copying .gitconfig into home directory
echo -e "${CYAN}Copying .gitconfig to home directory${NC}"
cp .gitconfig ~

# Copy vimrc into home folder
echo -e "${CYAN}Copying .vimrc to home directory${NC}"
cp .vimrc ~
cp -r .vim ~ 

# Install Vundle package manager
echo -e "${CYAN}Installing Vundle package manager${NC}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install monokai theme
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
mkdir ~/.vim/colors
mv monokai.vim ~/.vim/colors/

# Install vim plugins
vim -c PluginInstall -c q -c q

# Compile YCM with C language sematic support
echo -e "${CYAN}Compliling YCM${NC}"
pushd .
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
popd

# Set default shell to zsh
echo -e "${CYAN}Changing shell to zsh${NC}"
chsh -s $(which zsh)

# Install Oh My Zsh
echo -e "${CYAN}Installing Oh My Zsh${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -B)"

# Copy over .zshrc
echo -e "${CYAN}Copying .zshrc to home directory${NC}"
cp .zshrc ~

# Copy over wallpaper
echo -e "${CYAN}Copying Wallpaper to Pictures directory${NC}"
cp -r Pictures ~

# Get font awesome
echo -e "${CYAN}Installing font awesome${NC}"
wget https://github.com/FortAwesome/Font-Awesome/releases/download/5.2.0/fontawesome-free-5.2.0-desktop.zip
unzip fontawesome-free-5.2.0-desktop.zip
sudo mv fontawesome-free-5.2.0-desktop /usr/local/share/fonts

# Copy over i3 config
i3-config-wizard
cp .config/i3/config ~/.config/i3/config
