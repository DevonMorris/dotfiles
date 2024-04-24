# Bash .bashrc
# author: Devon Morris
# contact: devonmorris1992@gmail.com
# date: Fri Apr 16 20:25:34 EDT 2021

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source system config if available
[ -r /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -r /etc/bashrc ] && source /etc/bashrc

# Source configurations
source "$HOME/.shell.d/detection.sh"
source "$HOME/.shell.d/git-prompt.sh"
source "$HOME/.shell.d/path.sh"
source "$HOME/.shell.d/fzf.sh"
source "$HOME/.shell.d/history.sh"
source "$HOME/.shell.d/pager.sh"
source "$HOME/.shell.d/settings.bash"
source "$HOME/.shell.d/prompt.bash"
source "$HOME/.shell.d/editor.sh"
source "$HOME/.shell.d/python.sh"
source "$HOME/.shell.d/haskell.sh"
source "$HOME/.shell.d/ocaml.sh"
source "$HOME/.shell.d/rust.sh"
source "$HOME/.shell.d/go.sh"
source "$HOME/.shell.d/dircolors.sh"
source "$HOME/.shell.d/completion.bash"
source "$HOME/.shell.d/aliases.sh"
source "$HOME/.shell.d/z.sh"
source "$HOME/.shell.d/forgit.sh"
source "$HOME/.shell.d/direnv.sh"
source "$HOME/.shell.d/node.sh"
source "$HOME/.shell.d/ocaml.sh"

# Work related config
[ -f $HOME/.shell.d/work.sh ] && source "$HOME/.shell.d/work.sh"
