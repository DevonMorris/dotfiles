export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
[[ -x "$(command -v atuin)" ]] && eval "$(atuin init bash)"

function atuin-off {
    export ATUIN_DB_PATH=/tmp/atuin_dev.db
    export ATUIN_RECORD_STORE_PATH=/tmp/atuin_records.db
}
