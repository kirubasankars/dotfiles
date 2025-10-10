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
alias gs="git status"
alias gf="git diff"
alias gl="git log"

alias maand="/home/kirubasankars/go/src/maand-go/maand"

PS1='[\u@\h \W]\$ '

eval "$(fzf --bash)"
