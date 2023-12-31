#zmodload zsh/zprof

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git dirhistory zsh-autosuggestions zsh-syntax-highlighting command-not-found)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#unsetopt completealiases


alias ls="eza --icons always"
alias la="eza --icons always --all --long --group"
alias clear="printf '\033[2J\033[3J\033[1;1H'"
alias cp="rsync -P"

alias hx="helix"

#zprof

# Created by `pipx` on 2023-12-19 17:15:55
export PATH="$PATH:/home/alex/.local/bin"
export PATH="$PATH:/home/alex/.config/emacs/bin"
