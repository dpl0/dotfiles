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
alias wscan "sudo ifconfig wlan0 list scan"

alias tsc="ping google.com"
alias triton="ssh -N -f -L 2222:arctic.cmima.csic.es:22 peyrolon@triton.cmima.csic.es"
alias arctic="ssh peyrolon@localhost -p 2222"
alias vm="ssh -i ~/.ssh/netperf dpl@107.191.46.83"
alias vmftp="sftp -i ~/.ssh/netperf dpl@107.191.46.83"
alias zoo="ssh -i ~/.ssh/netperf dpl@zoo.FreeBSD.org"


export BLOCKSIZE=K
export EDITOR=vim
export PAGER=less
export PLAN9=/usr/local/plan9/
export GOROOT=/usr/local/go/
export GOPATH=$HOME/os/go
export PATH="$HOME/bin:$PATH:$GOROOT/bin"

export LC_CTYPE="en_US.UTF-8"

autoload -U colors && colors
export PS1='%n@%m %~ %# '
export PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%% "
export PS1="%{$bg[white]$fg[black]%}%2d%{$reset_color%} %% "
export RPROMPT='%(?..[%?])'
