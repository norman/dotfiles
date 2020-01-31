export BASE_PATH=~/bin:~/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin
export PATH=$BASE_PATH
export LC_CTYPE UTF8
export RBENV_VERSION=2.6.3
export LESS="-R"

export PS1='$ '
export EDITOR=vim
export PAGER="less"
export CSCOPE_DB=cscope.out
export DIRENV_LOG_FORMAT=

alias ls="ls -G"
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

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
