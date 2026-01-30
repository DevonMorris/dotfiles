# Install atuin if not installed
[ ! -d $HOME/.atuin ] && curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

if which atuin &> /dev/null; then
    [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
    eval "$(atuin init bash)"
fi
