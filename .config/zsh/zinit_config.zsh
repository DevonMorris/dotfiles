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
zp()  { [ -z $2 ] && zinit light $@ || zinit $@; } # zinit

### Oh-my-zsh libs
zpi atinit'ZSH_CACHE_DIR="$HOME/.zcompcache"'
zp snippet OMZ::lib/history.zsh

zpt 0a
zp snippet OMZ::lib/completion.zsh

zp snippet OMZ::lib/git.zsh

zp snippet OMZ::plugins/git/git.plugin.zsh
setopt promptsubst

zp snippet OMZ::plugins/virtualenv/virtualenv.plugin.zsh

zp snippet OMZ::lib/theme-and-appearance.zsh
zp snippet OMZ::lib/spectrum.zsh

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
