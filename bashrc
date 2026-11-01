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

__bold='\[\033[1m\]'
__reset='\[\033[0m\]'
__red='\[\033[31m\]'
__green='\[\033[32m\]'
__blue='\[\033[34m\]'
__magenta='\[\033[35m\]'
__cyan='\[\033[36m\]'


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

    # conda env if active
    PS1="${__magenta}${promptpy}${__reset}"

    # uname
    PS1+="${__bold}${__blue}\u${__reset}"

    #hostname
    PS1+="${__cyan}@\h"

    # directory
    PS1+=" ${__reset}\w"

    # prompot output
    PS1+=" ${__bold}\$${__reset} "
    # PS1="${promptpy}${__bold}\u@\h${__reset} ${promptdir} ${promptout} "
}

# Run before each prompt, ahead of anything else already in PROMPT_COMMAND
PROMPT_COMMAND="__build_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

fi
