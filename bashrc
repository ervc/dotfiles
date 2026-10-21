###############
### ALIASES ###
###############

alias ls="ls --color=auto"
alias ll='ls --color=auto -alh'
alias ..="cd .."
alias duh="du -d1 -h | sort -h"
mkcd () { mkdir -p $1 && cd $1; }

###############
### PHANTOM ###
###############

export OMP_SCHEDULE="dynamic"
export OMP_STACKSIZE=512M
ulimit -s unlimited
export SYSTEM=gfortan
