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
alias ls="ls -F --color=auto"
alias la="ls -a"
alias lf="ls -A"
alias ll="ls -lA"

alias tma="tm attach -t"
alias tm="tmux -2u"
alias feh="feh -. -Z"
alias less="less -R"
alias wscan="sudo ifconfig wlan0 list scan"

alias minotauro="ssh -X bsc15224@mt1.bsc.es"
alias marenostrum="ssh -X bsc15224@mn1.bsc.es"

alias tsc="ping google.com"
alias arctic="ssh peyrolon@localhost -p 2222"

alias vm="ssh -i ~/.ssh/netperf dpl@107.191.46.83"
alias vmftp="sftp -i ~/.ssh/netperf dpl@107.191.46.83"
alias zoo="ssh -i ~/.ssh/netperf dpl@zoo.FreeBSD.org"

alias pptm="ssh -X pptm71005@mn1.bsc.es"

export BLOCKSIZE=K
export EDITOR=vim
export PAGER=less
export PLAN9=/usr/lib/plan9/
export GOROOT=/usr/lib/go/
export GOPATH=$HOME/os/go
export PATH="$HOME/bin:$PATH:$GOROOT/bin:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/dev/OmpSs/mcxx-install/bin:$HOME/dev/OmpSs/wxparaver-4.6.0-linux-x86_64/bin"

export LC_CTYPE="en_US.UTF-8"

autoload -U colors && colors
export PS1='%n@%m %~ %# '
export PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%% "
export PS1="%{$bg[white]$fg[black]%}%2d%{$reset_color%} %% "
export RPROMPT='%(?..[%?])'

if [ `tty` = "/dev/tty1" ]
then
	startx
fi
