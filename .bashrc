#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PS0="\n"
export PS1="\n\[\e[38;5;243m\]╭─── \u \[\e[38;5;249m\]Λrch \[\e[38;5;254m\]◜\w◞ \[\e[38;5;243m\]\n│\n╰─ \[\e[38;5;249m\]$ \[\e[38;5;254m\]"

export GOPATH=$HOME/.config/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE="on"
