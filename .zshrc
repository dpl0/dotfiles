# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dpl/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt autocd autopushd pushdignoredups

alias h="history 25"
alias j="jobs -l"
alias ls="ls -FG"
alias la="ls -a"
alias lf="ls -A"
alias ll="ls -lA"

alias tma="tm attach -t"
alias tm="tmux -2u"
alias feh="feh -. -Z"
alias less="less -R"
alias tsc="ping google.com"
alias remount="sudo mount -o remount,exec /dev/mmcblk1p1 /media/removable/SD"

export PATH="$HOME/bin:$PATH"
export RISCV="$HOME/uni/MA/rv-toolchain"
export PATH="$PATH:$HOME/bin:$RISCV/bin:$RISCV/riscv/bin"

export BLOCKSIZE=K
export EDITOR=vim
export PAGER=less
export PLAN9=/usr/local/plan9/
export LC_CTYPE="en_US.UTF-8"

autoload -U colors && colors
export PS1='%n@%m %~ %# '
export PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%% "
export PS1="%{$bg[white]$fg[black]%}%2d%{$reset_color%} %% "
export RPROMPT='%(?..[%?])'
