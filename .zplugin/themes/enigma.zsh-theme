# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$FG[245]%~\
$(git_prompt_info) \
$FG[174]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_blue='$FG[024]'
eval my_pink='$FG[174]'
eval my_green='$FG[072]'
eval my_gray='$FG[245]'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$my_blue%n@%m%{$reset_color%}%'
else
	RPROMPT='$my_blue%n@%m %T%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$my_gray($my_green"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_pink*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$my_gray)%{$reset_color%}"
