# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source $HOME/tools/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-interactive-cd

# search for file and edit it with ctrl+p
#antigen bundle mafredri/zsh-async
#antigen bundle seletskiy/zsh-fuzzy-search-and-edit

#antigen bundle Aloxaf/fzf-tab
#antigen bundle lincheney/fzf-tab-completion
#antigen bundle changyuheng/zsh-interactive-cd

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
# antigen theme robbyrussell
antigen theme ys

# Tell Antigen that you're done.
antigen apply

# for seletskiy/zsh-fuzzy-search-and-edit
# search for file and edit it with ctrl+p
# export EDITOR=vim
# bindkey '^P' fuzzy-search-and-edit

# Use theme from file.
source $HOME/.oh-my-zsh/themes/myys.zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_COMMAND='ag -l -g ""'
#
#zstyle ':completion:*' menu select interactive

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
# cf() {
#   local file
# 
#   file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"
# 
#   if [[ -n $file ]]
#   then
#      if [[ -d $file ]]
#      then
#         cd -- $file
#      else
#         cd -- ${file:h}
#      fi
#   fi
# }

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
[[ -s $HOME/tools/mysh_rc.sh ]] && source $HOME/tools/mysh_rc.sh

unsetopt share_history
echo $HOME

