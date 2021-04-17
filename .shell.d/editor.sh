if which nvim &>/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
  export EDITOR_PREFIX=nvim
else
  export EDITOR=vim
  export VISUAL=vim
  export EDITOR_PREFIX=vim
fi
