if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if type pandoc &>/dev/null; then
  eval "$(pandoc --bash-completion)"
fi

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
