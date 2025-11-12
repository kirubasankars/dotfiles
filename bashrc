#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias copy="wl-copy"
alias paste="wl-paste"
alias calc="python3"
alias vim='nvim'
alias a="alias"
alias n="nvim"
alias l="ls"
alias c="clear"
alias e="exit"
alias ll="ls -l"
alias t="tree"
alias la="ls -la"
alias top="btop"

alias ss="git status"
alias dd="git diff"
alias gg="git log"

alias ff="fastfetch"
alias ww="curl wttr.in/edison"
alias batt="cat /sys/class/power_supply/BAT0/capacity"

PS1='\W \$ '
eval "$(fzf --bash)"

function tt() {
  echo "IST :" $(TZ="Asia/Kolkata" date)
  echo "EST :" $(date)
}
