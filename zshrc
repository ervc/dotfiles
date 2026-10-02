source ~/.bashrc

##############
### PROMPT ###
##############
# get git info
autoload - Uz vcs_info
# style the git status
zstyle ':vcs_info:*' formats '[%b]'
NEWLINE=$'\n'
# parse git status from David Myers
# https://dev.to/voracious/a-guide-to-customizing-the-zsh-shell-prompt-2an6
parse_git_dirty() {
  git_status="$(git status 2> /dev/null)"
  [[ "$git_status" =~ "Changes to be committed:" ]] && echo -n "%F{green}*%f"
  [[ "$git_status" =~ "Changes not staged for commit:" ]] && echo -n "%F{yellow}*%f"
  [[ "$git_status" =~ "Untracked files:" ]] && echo -n "%F{red}*%f"
  [[ "$git_status" =~ "Your branch is ahead" ]] && echo -n "%F{cyan}^%f"
}
py_env() {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo -n "%F{magenta}(${CONDA_DEFAULT_ENV})%f "
    fi
}
precmd() {
    vcs_info # stores version control to vcs_info_msg_0_
    PROMPTPY="$(py_env)"
    PROMPTDIR="%F{blue}%~%f"
    PROMPTGIT="%F{gray}${vcs_info_msg_0_}%f$(parse_git_dirty)"
    # Check last output
    PROMPTOUT="%(?.%F{green}>%f.%F{red}>%f)"
    PROMPT="${NEWLINE}${PROMPTDIR} ${PROMPTGIT}${NEWLINE}${PROMPTPY}%B%n%b ${PROMPTOUT} "
}

###################
### CONDA SETUP ###
###################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ericvc/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ericvc/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/ericvc/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ericvc/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/Users/ericvc/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/ericvc/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
