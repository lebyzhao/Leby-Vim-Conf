#export Lgnosterw.w.wgnosterw.w.wANG="zh_CN.GB2312"
#export LC_CTYPE="zh_CN.GB2312"
#export LANG="en_US.GB2312"
export LANG="en_US.UTF-8"

#[[ -s "/etc/profile.d/grc.bashrc" ]] && source /etc/profile.d/grc.bashrc
alias ll='ls -l --color'
alias l='ls -l --color'

# User specific aliases and functions
export CLICOLOR=1

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#do not do this
#export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}" --height 40% --layout=reverse --border --inline-info'
export FZF_DEFAULT_OPTS='--height 40% '
#export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git '
#export FZF_DEFAULT_COMMAND='ag -g '
export FZF_ALT_C_COMMAND='find ./ -maxdepth 3 -type d | sort'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#d() {                                                                 
#  local cmd dir                                                                
#  cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
#    -o -type d -print 2> /dev/null | cut -b3-"}"                               
#  dir=$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m) && cd "$dir"
#}

f() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fd - cd to selected directory
d() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -maxdepth 2 -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file
  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
    if [[ -d $file ]]
    then
      cd -- $file
    else
      cd -- ${file:h}
    fi
  fi
}

dirdiff() {
  # Shell-escape each path:
  DIR1=$(printf '%q' "$1"); shift
  DIR2=$(printf '%q' "$1"); shift
  vim $@ -c "DirDiff $DIR1 $DIR2"
}

alias -g gl='git lg | head -n 10'                                                 
alias -g gd='git d'
alias -g gs='git status'

alias -g bmm='sh ./build.sh bear '
alias -g bmc='cd ./src; make clean; cd -'
alias -g bm='~/tools/bear_make.sh '

alias -g fmm='sh ./build.sh fast '
alias -g fmc='sh ./build.sh clean'
alias -g fm='sh ./build.sh'

alias -g rsync="rsync -e'ssh -p36000' "
alias -g rm='rm -i'
alias -g cp='cp -i'
alias -g mv='mv -i'
alias -g grep='grep --color'
alias -g egrep='egrep --color'
alias -g fgrep='fgrep --color'

alias -g gtt='~/tools/ssh_tt.sh '
alias -g gtt1='~/tools/ssh_tt1.sh '
alias -g gttr='~/tools/ssh_tt_root.sh '
alias -g gttr1='~/tools/ssh_tt_root1.sh '

alias -g g='source ~/tools/my-cd.sh '
alias -g svndiff='svn up; svn diff -r PREV:COMMITTED ./'
alias -g svnlog='svn up; echo -ne "\neg:svn diff -r r122994:r124444 --summarize|XXX.cpp\n\n"; svn log | head -n 100'
alias -g vnote='vim ~/docs/note.md'
alias -g vtest='vim ~/docs/test_cases.md'
alias -g vshell='vim ~/docs/shell.sh'
alias -g vdb='vim ~/docs/db_op.sql'
alias -g vcmd='vim /home/lebyzhao/git/__masters/tenpay_core_comm/comm/include/trans_comm/TransCmdInner.h'
alias -g vlog='vim ~/docs/work_note.md'

svn() {
  if [[ $@ == "up" ]]; then
    command svn up; echo "extra files:"; svn st | grep "^?"
  else
    command svn "$@"
  fi
}

export TERM=xterm-256color
export PATH="/root/.yarn/bin:/data/home/lebyzhao/.cargo/bin/:/root/.config/yarn/global/node_modules/.bin:/data/home/lebyzhao/apps/vim82/bin/:/data/llvm11/bin/:/data/fd/:/usr/local/libexec/git-core/:/data/home/lebyzhao/.fzf/bin/:$PATH"
export PATH="$PATH:$HOME/.ft"
export LD_LIBRARY_PATH=/usr/local/zftmysql/lib/:$LD_LIBRARY_PATH

echo "---------->load my shell tools...done"

