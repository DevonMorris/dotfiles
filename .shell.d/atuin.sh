if which atuin &> /dev/null; then
    [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
    eval "$(atuin init bash)"
    . "$HOME/.atuin/bin/env"
fi
