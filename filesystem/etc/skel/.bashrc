#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default aliases

eval "$(zoxide init bash)"
alias ls='eza'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias grep='grep --color=auto'

# Aliases for other stuff

alias web='w3m'
alias files='spf'

alias text='nvim'
alias mpx='tmux'


PS1='[\u@\h \W]\$ '
