#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias vim='nvim'
alias l="ls"
alias ll="ls -l"
alias t="tree"
alias la="ls -la"
alias s="git status"
alias d="git diff"
alias l="git log"
alias t="btop"

PS1=' \W \$ '

eval "$(fzf --bash)"
