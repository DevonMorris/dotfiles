#!/usr/bin/env bash
selected=`cat ~/scripts/.tmux-cht-languages ~/scripts/.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs $selected ~/scripts/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    curl -s cht.sh/$selected/$query | less -R
else
    curl -s cht.sh/$selected~$query | less -R
fi
