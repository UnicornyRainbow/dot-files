# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\[\e[35m\]\# > \[\e[33m\]\t >\`if [ \$? != 0 ]; then echo '\[\e[36m\] \W >\a\[\e[1;31m\] error\n>'; else echo '\[\e[36m\] \W\n>'; fi\`\[\e[0;00m\] "

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# aliases

alias gimme='sudo dnf install'
alias yeet='sudo dnf remove'
alias news='sudo dnf upgrade'
alias clean='sudo dnf autoremove'
alias play='nvlc ./'

hyfetch

#PATH="/home/unicorn/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/unicorn/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/unicorn/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/unicorn/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/unicorn/perl5"; export PERL_MM_OPT;
