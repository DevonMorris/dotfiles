# Bash .bashrc
# author: Devon Morris
# contact: devonmorris1992@gmail.com
# date: Fri Apr 16 20:25:34 EDT 2021

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
source "$HOME/.shell.d/dircolors.sh"
source "$HOME/.shell.d/completion.bash"
source "$HOME/.shell.d/aliases.sh"
source "$HOME/.shell.d/z.sh"
