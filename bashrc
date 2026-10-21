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

##############
### PROMPT ###
##############
# simple bash version of command prompt
if [ -n "$BASH_VERSION" ]; then

__bold_on='\[\033[1m\]'       # like zsh %B
__bold_off='\[\033[22m\]'     # like zsh %b


py_env() {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        printf '%s' "(${CONDA_DEFAULT_ENV}) "
    fi
}

# Equivalent of zsh's precmd()
__build_prompt() {
    local promptpy promptdir promptgit promptout

    promptpy="$(py_env)"
    promptdir="\w"
    promptout="\$"

    PS1="${promptdir}\n${promptpy}${__bold_on}\u@\h${__bold_off} ${promptout} "
}

# Run before each prompt, ahead of anything else already in PROMPT_COMMAND
PROMPT_COMMAND="__build_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

fi
