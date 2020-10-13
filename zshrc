fpath=(/usr/local/share/zsh-completions $fpath)

# Completions don't work without this
autoload -Uz compinit ; compinit -u

# Support bash env var
precmd() { eval "$PROMPT_COMMAND" }
bindkey -e

export BASE_PATH=~/bin:~/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/local/bin
export PATH=$BASE_PATH
export LC_CTYPE UTF8
export RBENV_VERSION=2.7.2
export LESS="-R"

export PS1='$ '
export EDITOR=vim
export PAGER="less"
export CSCOPE_DB=cscope.out

# Silence noisy direnv
export DIRENV_LOG_FORMAT=

# Don't use pager if output fits on single screen
export GIT_PAGER="less -F -X"

# Make fzf repsect .gitignore files
export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'

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
