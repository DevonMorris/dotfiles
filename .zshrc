# Zsh .zshrc
# author: Devon Morris
# contact: devonmorris1992@gmail.com
# date: Thu 01 Oct 2020 09:38:24 AM EDT
# Custom zsh configuration built using zinit
skip_global_compinit=1

# If you aren't running a desktop manager like gdm, this file won't get loaded
# So we will load it manually
source $HOME/.profile

# Skips the global compinit
skip_global_compinit=1

### Environment Variables
source $HOME/.config/zsh/var_config.zsh

### Zinit config (Note: should go near top of file)
source $HOME/.config/zsh/zinit_config.zsh

### Keybindings
source $HOME/.config/zsh/keybindings.zsh

### Theme
source $HOME/.config/zsh/pygmalion-virtualenv.zsh-theme

### Aliases
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/torc_aliases.zsh

### Fzf Config
source $HOME/.config/zsh/fzf_config.zsh

# Launch X from tty1 upon login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

unsetopt share_history

# Function for managing dotfiles
function dots {
   /usr/bin/env git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/ros/melodic ] && source /opt/ros/melodic/setup.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "/home/devon/.ghcup/env" ] && source "/home/devon/.ghcup/env" # ghcup-env
if [ -e /home/devon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/devon/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
