source ~/.bashrc

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

export PS1='$ '

export EDITOR=vim
export PAGER="less -X"

alias ls="ls -G"
alias less='less -R'
alias irb='irb --simple-prompt --readline'

alias gs='git status'
alias gl='git log'
alias gc='git commit'
alias gca='git commit --amend'
alias ga='git add'
alias gap='git add -p'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gb='git branch'
alias grmall='git diff --name-only --diff-filter=D -z | xargs -0 git rm --cached'

alias tmux="tmux -2"
alias bake='bundle exec rake'
alias bopen='EDITOR=mate bundle open'
alias bspec='bundle exec rspec'
alias bap='bundle exec cap'
alias bruby='bundle exec ruby'

eval "$(rbenv init -)"
eval "$(direnv hook bash)"
