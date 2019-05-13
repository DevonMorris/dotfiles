#!/usr/bin/env bash

CYAN='\033[0;36m'
NC='\033[0m'

# Install Prerequisite apt packages
echo -e "${CYAN}Installing prerequsite packages${NC}"
sudo apt install feh zsh i3 i3lock git fonts-powerline wget pavucontrol zathura arandr ranger python3 libglib2.0-0 libgl1 libfontconfig1 libx11-xcb1 libxi6 libxrender1 libdbus-1-3 tox asciidoc silversearcher-ag fonts-font-awesome libncurses5-dev dbus-x11 xdotool xclip compton scrot rxvt-unicode-256color ncmpcpp

# Copying .Xresources
echo -e "${CYAN}Symlinking .Xresources to home directory${NC}"
ln -svf `pwd`/.Xresources $HOME/.Xresources

# Copying .xinitrc
echo -e "${CYAN}Symlinking .xinitrc to home directory (Make sure to generate proper screen layout)${NC}"
ln -svf `pwd`/.xinitrc $HOME/.xinitrc

# Copying .gitconfig into home directory
echo -e "${CYAN}Symlinking .gitconfig to home directory${NC}"
ln -svf `pwd`/.gitconfig $HOME/.gitconfig

# Copy vimrc into home folder
echo -e "${CYAN}Symlinking .vimrc to home directory${NC}"
ln -svf `pwd`/.vimrc $HOME/.vimrc

# Install vim plugins
vim -c PlugInstall -c q -c q

# Copying Ultisnips
echo -e "${CYAN}Symlinking UltiSnips to .vim directory${NC}"
ln -svf `pwd`/UltiSnips $HOME/.vim

# Set default shell to zsh
echo -e "${CYAN}Changing shell to zsh${NC}"
chsh -s $(which zsh)

# Install Oh My Zsh
echo -e "${CYAN}Installing Oh My Zsh${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -B)"

# Symlink themes
echo -e "${CYAN}Installing Gruvbox Themes${NC}"
ln -svf `pwd`/oh-my-zsh-themes/gruvbox.zsh-theme $HOME/.config/.oh-my-zsh/molokai.zsh-theme
ln -svf `pwd`/airline-themes/gruvbox.vim $HOME/.vim/plugged/vim-airline-themes/autoload/airline/themes/gruvbox.vim

# Symlink neofetch config
echo -e "${CYAN}Symlinking Neofetch Config${NC}"
ln -svf `pwd`/.config/neofetch/config.conf $HOME/.config/neofetch/config.conf

# Copy over .zshrc
echo -e "${CYAN}Symlinking .zshrc to home directory${NC}"
ln -svf `pwd`/.zshrc $HOME/.zshrc

# Copy over wallpaper
echo -e "${CYAN}Copying Wallpaper to Pictures directory${NC}"
cp -r Pictures $HOME

# Copy over i3 config
echo -e "${CYAN}Symlinking i3 Config${NC}"
ln -svf `pwd`/.config/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/i3status
ln -svf `pwd`/.config/i3status/config $HOME/.config/i3status/config
