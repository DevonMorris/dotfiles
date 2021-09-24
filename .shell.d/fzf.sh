# Install fzf if not installed
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

export FZF_DEFAULT_COMMAND='fd . -t f -H 2> /dev/null'
export FZF_CTRL_T_COMMAND='fd . -t f -H 2> /dev/null'
export FZF_CTRL_T_OPTS="--preview 'bat {} 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND='fd . -t d -H 2> /dev/null'
export FZF_ALT_C_OPTS="--preview 'tree {} 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

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
