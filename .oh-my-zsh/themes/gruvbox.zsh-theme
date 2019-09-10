# gruvbox.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='%{$reset_color%}
$FG[229]%~\
$(git_prompt_info) \
$FG[211]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_text='$FG[065]'
eval my_blue='$FG[159]'
eval my_pink='$FG[211]'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$my_text%n@%m%{$reset_color%}%'
else
	RPROMPT='$my_text%n@%m%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$my_text($my_blue"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_pink*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$my_text)%{$reset_color%}"
