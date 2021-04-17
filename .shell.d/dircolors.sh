if which dircolors &>/dev/null; then
  if [ -r ~/.dircolors/dircolors ]; then
    eval "$(dircolors -b ~/.dircolors/dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi
