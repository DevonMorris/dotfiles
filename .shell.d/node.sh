export NVM_DIR="$HOME/.nvm"

# Sourcing nvm.sh costs ~75ms, so put the default node version on PATH
# directly and defer loading nvm itself until first use
if [ -d "$NVM_DIR/versions/node" ]; then
  _nvm_default="$(cat "$NVM_DIR/alias/default" 2>/dev/null)"
  _nvm_bin="$(command ls -1d "$NVM_DIR/versions/node/v${_nvm_default#v}"* 2>/dev/null | sort -V | tail -1)"
  # Fall back to the newest installed version (e.g. when default is "lts/*")
  [ -z "$_nvm_bin" ] && _nvm_bin="$(command ls -1d "$NVM_DIR/versions/node/"v* 2>/dev/null | sort -V | tail -1)"
  [ -n "$_nvm_bin" ] && export PATH="$_nvm_bin/bin:$PATH"
  unset _nvm_default _nvm_bin
fi

nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm "$@"
}
