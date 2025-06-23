#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/doc/pkgfile/command-not-found.bash

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias grep='grep --color=auto'
alias ls='eza --icons'
alias la='eza --all --long --icons'
alias pmbootstrap='$HOME/.pmbootstrap/pmbootstrap.py'
