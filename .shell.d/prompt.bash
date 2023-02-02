export PS1w=$'\033[34m'
export PS1u=$'\033[35m'
export PS1a=$'\033[34m'
export PS1c=$'\033[31m'
export PS1g=$'\033[32m'
export PS1h=$'\033[33m'
export PS1d=$'\033[38;2;110;110;110m'
export PS1p=$PS1u
export PS1P=$'\033[31m'
export PS1U=$PS1P
if [[ -f "/.dockerenv" ]]; then
  export DOCK="(docked)"
else
  export DOCK=""
fi

if [[ $EUID == 0 ]]; then
  export PS1='$DOCK\[${PS1P}\]\u\[${PS1a}\]@\[${PS1h}\]\h\[${PS1c}\]:\[${PS1w}\]\W$(__git_ps1 "\[${PS1g}\](\[${PS1u}\]%s\[${PS1g}\])")\[$PS1d\]#\[\033[00m\] '
else
  export PS1='$DOCK\[${PS1u}\]\u\[${PS1a}\]@\[${PS1h}\]\h\[${PS1c}\]:\[${PS1w}\]\W$(__git_ps1 "\[${PS1g}\](\[${PS1u}\]%s\[${PS1g}\])")\[$PS1d\]$\[\033[00m\] '
fi
