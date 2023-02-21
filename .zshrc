# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd nomatch
unsetopt beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/unicorn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom Config

# User specific environment
if [[ $(uname) == "Darwin" ]]; then
	if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
	then
	    PATH="$HOME/Library/Python/3.8/bin:$HOME/.local/bin:$HOME/bin:$PATH"
	fi
else
	if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
	then
	    PATH="$HOME/Library/Python/3.8/bin:$HOME/.local/bin:$HOME/bin:$PATH"
	fi
fi
export PATH

#PATH="/home/unicorn/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/unicorn/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/unicorn/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/unicorn/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/unicorn/perl5"; export PERL_MM_OPT;

# aliases
alias ll='ls -laF'
alias venv='source .venv/bin/activate'
alias unvenv='deactivate'
alias cbat='bat --paging=never'

# needed keybindings
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char
if [[ $(uname) == "Darwin" ]]; then
	bindkey "^[^[[C" forward-word
	bindkey "^[^[[D" backward-word
else
	bindkey "^[[1;5C" forward-word
	bindkey "^[[1;5D" backward-word
fi

# Prompt

#export VIRTUAL_ENV_DISABLE_PROMPT=0
source "$HOME/.zsh/prompt/prompt.zsh"

# Syntax highlighting and autocomplete
#ZSH_AUTOSUGGEST_STRATEGY=completion

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

hyfetch


