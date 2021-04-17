# Install fzf if not installed
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

export FZF_DEFAULT_COMMAND='fd . -t f -H 2> /dev/null'
export FZF_CTRL_T_COMMAND='fd . -t f -H 2> /dev/null'
export FZF_CTRL_T_OPTS="--preview 'bat {} 2> /dev/null | head -200'"
export FZF_ALT_C_COMMAND='fd . -t d -H 2> /dev/null'
export FZF_ALT_C_OPTS="--preview 'tree {} 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

#
# FZF - pro level functions
#
# gco - checkout git branch/tag
gco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  [ -z "$branches" ] && return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
    --ansi)  || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

grb() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  [ -z "$branches" ] && return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
    --ansi)  || return
  git rebase $(awk '{print $2}' <<<"$target" )
}

# gsha - show sha of branch
gsha() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  [ -z "$branches" ] && return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
    --ansi)  || return
  git show-branch --sha1-name $(awk '{print $2}' <<<"$target" ) |
    awk '{print $1}' | tr -d '\[\]'
}


# gcoc - checkout git commit
gcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse)
  [ -z "$commits" ] && return
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

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
