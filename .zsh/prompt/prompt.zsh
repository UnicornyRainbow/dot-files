#!/bin/zsh

export VIRTUAL_ENV_DISABLE_PROMPT=1

gen_git_prompt() {
    local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [ "$ref" != "" ]; then
        if [ -n "$(git status --porcelain)" ]; then
            local gitstatus=' ±'
        else
            local gitstatus=''
        fi
        gitprompt=" $ref$gitstatus"
    else
        gitprompt="⚙ $(ps -u $USER | wc -l)"
    fi
}

gen_venv_prompt() {
    #echo $VIRTUAL_ENV | grep -oE "\.?[a-zA-Z]+$"
    if [ "$VIRTUAL_ENV" != "" ]; then
        venv_prompt="%F{green}%K{blue}%k $(echo $VIRTUAL_ENV | grep -oE '\.?[a-zA-Z]+$')%s%f"
    else
        venv_prompt="%s%f"
    fi
}

NEWLINE=$'\n'

precmd () {
    gen_git_prompt
    gen_venv_prompt
}

PROMPT_COMMAND="echo test"

setopt PROMPT_SUBST
PS1='%S%F{magenta} %n@%M%F{yellow}%K{magenta}%k %~%F{cyan}%K{yellow}%k %h%(?.%F{green}.%F{red})%K{cyan}%k %?%(?.√.✘)%F{blue}%(?.%K{green}.%K{red})%k $gitprompt$venv_prompt${NEWLINE}%S%(!.%F{red} #.%F{green} $)%s%f '
RPROMPT="%F{magenta}%S%* %K{yellow}%k%F{yellow}%w %K{cyan}%k%F{cyan}$(date +%b) %s%f"
# ╰ ─ ┬ │   ±  ➦ ✘ ⚡ ⚙
# black white yellow green red blue cyan magenta
# %($?.'%F{green}'.'%F{red}')
