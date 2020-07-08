# Timothy Devon Morris .zshrc
skip_global_compinit=1

# If you aren't running a desktop manager like gdm, this file won't get loaded
# So we will load it manually
source $HOME/.profile

# Skips the global compinit
skip_global_compinit=1

# Install zinit if not installed
if [ ! -d "${HOME}/.zinit" ]; then
  mkdir ${HOME}/.zinit
	git clone https://github.com/zdharma/zinit ${HOME}/.zinit/bin
	zcompile ${HOME}/.zinit/bin/zinit.zsh
fi

### Added by Zplugin's installer
source "${HOME}/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### Functions to make zinit configuration less verbose
zpt() { zinit ice wait"${1}" lucid               "${@:2}"; } # Turbo
zpi() { zinit ice lucid                            "${@}"; } # Regular Ice
zp()  { [ -z $2 ] && zinit light "${@}" || zinit "${@}"; } # zinit

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
zp snippet OMZ::themes/pygmalion-virtualenv.zsh-theme


### Zplugins
# Remember to make the last plugin loaded in turbo mode have atload'zpcompinit' for
# completion support, this will make plugin loading super snappy!
zp eendroroy/zed-zsh

zp wfxr/forgit

zpi as"completion"
zp snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zpt 0a blockf atpull'zinit creinstall -q .'
zp zsh-users/zsh-completions

zpt 0a
zp ael-code/zsh-colored-man-pages

zpt 0b '{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start'
zp zsh-users/zsh-autosuggestions

zpt 0b atload'zpcompinit;zpcdreplay'
zp zdharma/fast-syntax-highlighting

### Zplugin Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"

### all hail the one true editor
export EDITOR='nvim'

### Keybindings
source $HOME/.zinit/keybindings.zsh

#
# Aliases
#
alias vim="nvim"
alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias xresources="$EDITOR ~/.Xresources"
alias i3config="$EDITOR ~/.config/i3/config"
alias gitconfig="$EDITOR ~/.gitconfig"
alias alacrittyconfig="$EDITOR ~/.config/alacritty/alacritty.yml"
alias nb="jupyter notebook"
alias neofetchconfig="$EDITOR ~/.config/neofetch/config.conf"
alias pacman="sudo pacman"
alias wee="weechat"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/rti_connext_dds-5.3.1/bin:$PATH
export PATH=/snap/bin:$PATH

#
# FZF - pro level functions
#

unalias gco
# gco - checkout git branch/tag
gco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
    --ansi)  || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

unalias grb
grb() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
    --ansi)  || return
  git rebase $(awk '{print $2}' <<<"$target" )
}

# gsha - show sha of branch
gsha() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
    --ansi)  || return
  git show-branch --sha1-name $(awk '{print $2}' <<<"$target" ) |
    awk '{print $1}' | tr -d '\[\]'
}


# gcoc - checkout git commit
gcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Launch X from tty1 upon login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

#  Load fzf zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt share_history

# Function for managing dotfiles
function config {
   /usr/bin/env git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}
export FG_AIRCRAFT="$HOME/flightgear/Aircraft"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/devon/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/devon/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/devon/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/devon/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
