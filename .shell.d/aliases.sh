unalias -a

alias grep='grep -i --colour=auto'
alias egrep='egrep -i --colour=auto'
alias fgrep='fgrep -i --colour=auto'
alias ls='ls -h --color=auto'
alias '?'=duck

alias nb="jupyter notebook"
alias open="xdg-open"

alias free='free -h'
alias df='df -h'
alias top="htop"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

which nvim &>/dev/null && alias vim=nvim && alias vi=nvim
