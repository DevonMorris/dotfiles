# Timothy Devon Morris .zshrc

# Skips the global compinit
skip_global_compinit=1

# Install zplugin if not installed
if [ ! -d "${HOME}/.zplugin" ]; then
  mkdir ${HOME}/.zplugin
	git clone https://github.com/psprint/zplugin ${HOME}/.zplugin/bin
	zcompile ${HOME}/.zplugin/bin/zplugin.zsh
fi

### Added by Zplugin's installer
source "${HOME}/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

### Functions to make zplugin configuration less verbose
zpt() { zplugin ice wait"${1}" lucid               "${@:2}"; } # Turbo
zpi() { zplugin ice lucid                            "${@}"; } # Regular Ice
zp()  { [ -z $2 ] && zplugin light "${@}" || zplugin "${@}"; } # zplugin

### Oh-my-zsh libs
zpi atinit'ZSH_CACHE_DIR="$HOME/.zcompcache"'
zp snippet OMZ::lib/history.zsh

zpt 0a
zp snippet OMZ::lib/completion.zsh

zpt 0a
zp arzzen/calc.plugin.zsh

zp snippet OMZ::lib/git.zsh

zp snippet OMZ::plugins/git/git.plugin.zsh
setopt promptsubst

zp snippet OMZ::lib/theme-and-appearance.zsh
zp snippet OMZ::lib/spectrum.zsh


### Zplugins
# Remember to make the last plugin loaded in turbo mode have atload'zpcompinit' for
# completion support, this will make plugin loading super snappy!
zp eendroroy/zed-zsh

zp wfxr/forgit

zpi as"completion"
zp snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zpt 0a
zp laggardkernel/zsh-thefuck

zpt 0a blockf atpull'zplugin creinstall -q .'
zp zsh-users/zsh-completions

zpt 0a
zp ael-code/zsh-colored-man-pages

zpt 0b compile'{hsmw-*,test/*}'
zp zdharma/history-search-multi-word

zpt 0b '{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start'
zp zsh-users/zsh-autosuggestions

zpt 0a atload'zpcompinit'
zp zdharma/fast-syntax-highlighting

### Zplugin Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=237"

### Theme
source $HOME/.zplugin/themes/enigma.zsh-theme


### all hail the one true editor
export EDITOR='vim'

### Keybindings
source $HOME/.zplugin/keybindings.zsh

#
# Aliases
#
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias xresources="vim ~/.Xresources"
alias i3config="vim ~/.config/i3/config"
alias gitconfig="vim ~/.gitconfig"
alias nb="jupyter notebook"
alias neofetchconfig="vim ~/.config/neofetch/config.conf"
alias pacman="sudo pacman"
alias wee="weechat"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_ALT_C_COMMAND='ag --hidden --ignore .git -g ""'

export PATH=$HOME/.local/bin:$PATH

# Launch X from tty1 upon login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

#  Load fzf zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt share_history

# Function for managing dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
