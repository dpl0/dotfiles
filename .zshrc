# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/athos/.zshrc'

autoload -U colors && colors
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt appendhistory beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###
#Exports
###
#
export EDITOR="vim"
export PATH="$PATH:/home/athos/bin/"
export PAGER="less"
export BLOCKSIZE="M"

bindkey "\e[3~" delete-char

###
#Aliases
###
#
alias ls='ls -G'
alias ll='ls -l'
alias lla='ls -lah'
alias la='ls -a'

alias grep='grep --color'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias in='pkg_add'
alias search='noglob search'
search(){
	currentdir=`pwd`
	cd /usr/ports/ 
	make search name=${1}
	cd $currentdir
}
alias rmv='pkg_delete'
alias update='portsnap fetch update'

alias suspend='sudo acpiconf -s 3'

alias wpas='sudo wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf'
alias wpaa='sudo wpa_supplicant -i wlan1 -c /etc/wpa_supplicant.conf'

alias untar='tar -xvf'
alias tmux='tmux -2'

#Promt
# Color definitions
local reset black white red green blue cyan magenta yellow
reset="%{$reset_color%}"
black="%{$fg[black]%}"
blackb="%{$fg_bold[black]%}"
white="%{$fg[white]%}"
whiteb="%{$fg_bold[white]%}"
red="%{$fg[red]%}"
redb="%{$fg_bold[red]%}"
green="%{$fg[green]%}"
greenb="%{$fg_bold[green]%}"
blue="%{$fg[blue]%}"
blueb="%{$fg_bold[blue]%}"
cyan="%{$fg[cyan]%}"
cyanb="%{$fg_bold[cyan]%}"
magenta="%{$fg[magenta]%}"
magentab="%{$fg_bold[magenta]%}"
yellow="%{$fg[yellow]%}"
yellowb="%{$fg_bold[yellow]%}"
blackbg="%{$bg[black]%}"
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%#
#>: "

random_color(){
	random -e 7
	case $? in
		0) color=$white;;
		1) color=$green;;
		2) color=$blue;;
		3) color=$cyan;;
		4) color=$magenta;;
		5) color=$yellow;;
		6) color=$red;;
	esac
}
random_color
number_col="%(?.$green%?.$red%?)$reset"
path_col="$color%d$reset"

if [ `echo $TERM` = rxvt ]
then
	PROMPT="$white┌─[$number_col$white]─[$path_col$white]
└╼ $reset"
else
	PROMPT="[$number_col]-[$path_col]
$green>: $reset"
fi

#Set locale
export LANG=en_US.UTF-8
export LC_CTYPE=es_ES.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_MONETARY=es_ES.UTF-8
export LC_MESSAGES=en_US.UTF-8
export MM_CHARSET=es_ES.UTF-8

fortune freebsd-tips
