unalias -a

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

if which exa &>/dev/null; then
  alias ls='exa -h --color=auto'
  alias la='exa -h -al --color=auto'
else
  alias ls='ls -h --color=auto'
  alias la='ls -al -h --color=auto'
fi

if which fdfind &>/dev/null; then
  alias fd='fdfind'
fi

alias nb="jupyter notebook"
alias open="xdg-open"
alias muxn="tmuxinator"
alias devo="tmuxinator devo"

alias free='free -h'
alias df='df -h'
alias top="htop"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

which nvim &>/dev/null && alias vim=nvim && alias vi=nvim
