#zmodload zsh/zprof

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git dirhistory zsh-autosuggestions fast-syntax-highlighting command-not-found)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#unsetopt completealiases


alias ls="eza --icons always"
alias la="eza --icons always --all --long --group"
alias clear="printf '\033[2J\033[3J\033[1;1H'"
alias cp="rsync -P"

alias hx="helix"

alias gitui="gitui -t mocha.ron"

alias pmbootstrap="pmbootstrap.py"

#zprof

export PATH="$PATH:/home/alex/.local/bin"
export PATH="$PATH:/home/alex/.cargo/bin"
export PATH="$PATH:/home/alex/.config/emacs/bin"
export PATH="$PATH:/home/alex/programs/pmbootstrap"
