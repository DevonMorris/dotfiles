# Prompt colors. Plain shell variables (not exported) — bash expands
# them in-shell when rendering PS1, and children don't need them.
PS1w=$'\033[34m'       # working dir / @ separator
PS1u=$'\033[35m'       # user
PS1c=$'\033[31m'       # colon
PS1g=$'\033[32m'       # git parens
PS1h=$'\033[33m'       # host
PS1d=$'\033[38;5;242m' # prompt char, last command succeeded
PS1e=$'\033[31m'       # prompt char, last command failed
PS1P=$'\033[31m'       # root user

if [[ -f "/.dockerenv" ]]; then
  DOCK="(docked)"
else
  DOCK=""
fi

# Color the prompt character by the last command's exit status.
# Must run first in PROMPT_COMMAND so $? is still the user's command.
__prompt_status() {
  if (( $? == 0 )); then
    PS1s=$PS1d
  else
    PS1s=$PS1e
  fi
}
PROMPT_COMMAND="__prompt_status${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

if [[ $EUID == 0 ]]; then
  PS1='$DOCK\[${PS1P}\]\u\[${PS1w}\]@\[${PS1h}\]\h\[${PS1c}\]:\[${PS1w}\]\W$(__git_ps1 "\[${PS1g}\](\[${PS1u}\]%s\[${PS1g}\])")\[${PS1s}\]#\[\033[00m\] '
else
  PS1='$DOCK\[${PS1u}\]\u\[${PS1w}\]@\[${PS1h}\]\h\[${PS1c}\]:\[${PS1w}\]\W$(__git_ps1 "\[${PS1g}\](\[${PS1u}\]%s\[${PS1g}\])")\[${PS1s}\]$\[\033[00m\] '
fi
