if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set $PATH for flatpak
set PATH /home/unicorn/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin $PATH
# Set $PATH for latex (perl required for latex)
set PATH /home/unicorn/perl5/bin /usr/local/texlive/2022/bin/x86_64-linux $PATH
# pip binaries
set PATH /home/unicorn/.local/bin $PATH
# currently empty
set PATH /home/unicorn/bin $PATH

hyfetch
