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

#Promt

#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%#
#>: "

PROMPT="%{$fg[green]%}%d %{$reset_color%}
%# "
RPROMPT="[%{$fg[red]%}%?%{$reset_color%}]"

#Set locale
export LANG=en_US.UTF-8
export LC_CTYPE=es_ES.UTF-8
export LC_COLLATE=es_ES.UTF-8
export LC_TIME=es_ES.UTF-8
export LC_NUMERIC=es_ES.UTF-8
export LC_MONETARY=es_ES.UTF-8
export LC_MESSAGES=en_US.UTF-8
export MM_CHARSET=es_ES.UTF-8
