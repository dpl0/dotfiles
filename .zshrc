# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Emacs-like line edition
# bindkey -e
# # Autocompletion
# autoload -Uz compinit && compinit
# # With menu
# # zstyle ":completion:*" menu select
# # Autocomplete aliases switches
# setopt complete_aliases
# # cd when given a path
# setopt autocd
# # Use extended globbing patterns
# setopt extendedglob
# # Error when not match for pattern
# setopt nomatch
# unsetopt beep notify
# # The following line were added by compinstall
# zstyle :compinstall filename '/home/dpl/.zshrc'
# autoload -U colors && colors
# # Append to history file, always
# setopt appendhistory
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zsh_history
# End of ZSH configuration

function git-prompt-info
{
    BRANCH=`git branch 2>/dev/null | awk '/^\*/{print $2}'`
    if [ $BRANCH ]; then
        MODIFIED=`git status -s | grep "^ M"`
        STAGED=`git status -s | grep "^M"`
        MISSING=`git status -s | grep "^??"`
        if [ $MODIFIED ]; then
            BRANCH="$BRANCH$fg[red]*$fg[default]"
        fi
        if [ $STAGED ]; then
            BRANCH="$BRANCH$fg[green]*$fg[default]"
        fi
        if [ $MISSING ]; then
            BRANCH="$BRANCH$fg[yellow]?$fg[default]"
        fi
        echo -n "($BRANCH) "
    else
        echo -n ""
    fi
}

# # Perform arithmetic, if needed
# setopt prompt_subst
# # If $? != 0, print
# export RPROMPT='%(?..[%?])'
# export PROMPT='$fg[black]$bg[white]%d$fg[default]$bg[default] $(git-prompt-info)%% '
# # export PROMPT='$fg[black]$bg[white]%d$fg[default]$bg[default] %% '

export DEV=$HOME/dev

export BLOCKSIZE=K
export EDITOR=nvim
export PAGER=less
export LC_CTYPE="en_US.UTF-8"
export GOROOT=/usr/lib/go
export GOPATH=$DEV/gopath

export CCACHEPATH=/usr/lib/ccache
export RUSTPATH=$HOME/.cargo/bin
export CABALPATH=$HOME/.cabal/bin
export PATH="$HOME/bin":$CCACHEPATH:$RUSTPATH:$PATH:"$GOROOT/bin"

# PLAN9=/home/dpl/dev/plan9port export PLAN9
# PATH=$PATH:$PLAN9/bin export PATH
# unalias 9

alias less="less -R"
alias ls="ls -F --color=auto"
alias shred="shred -n 7 -u"
# alias ls="ls -GF"

alias tmux="tmux -2u"
alias tm="tmux -2u"
alias tma="tm attach -t"

alias feh="feh -. -Z"
alias slideshow="feh -. -F -D7"
alias images="feh -. -F -z -D7"

alias vim="nvim"
alias vimdiff="nvim -d"
alias ag="ag --ignore tags"

alias ase="ssh ase@45.55.194.211"

# Networking
alias wscan="sudo ifconfig wlan0 list scan"
alias tsc="ping google.com"
alias vm="ssh -i ~/.ssh/netperf  dpl@107.191.46.83"
alias vmftp="sftp -i ~/.ssh/netperf  dpl@107.191.46.83"
alias raspie="ssh doxbot@3cur2ow5azgaqru4.onion"
alias raspie-deploy="ssh deploy@3cur2ow5azgaqru4.onion"

# Useful places
alias dev="cd $DEV"
alias tmp="cd $HOME/tmp"
alias scratch="cd $HOME/tmp/scratch"
alias dacomp="cd $DEV/DACOMPILER"
alias davm="cd $DEV/DAVM"
alias compiler="cd $DEV/compiler"
alias code="cd $DEV/coding_practice"
alias rust="cd $DEV/programming_rust"
alias cryptopals="cd $DEV/programming_rust"
alias clisp="cd $DEV/landoflisp"
alias paper="cd $DEV/paper_notes"

#
# Utils
#
# Sync dotfiles forlder with system dotfiles
# function syncdotfiles
#     x dotfiles ~/os/dotfiles/
#     set -x files ~/.Xresources ~/.Xmodmap ~/.spectrwm.conf ~/.tmux.conf \
#         ~/.vimrc ~/.xinitrc ~/.xxxterm.conf ~/.zshrc \
#         ~/.config/fish/config.fish ~/.config/zathura/zathurarc \
#         ~/.vitunes/vitunes.conf
#     cp $files $dotfiles
#     pushd $dotfiles
#     git add -A; git commit; git push
#     popd
# end

# Encrypt a set of files into a GPG'ed tar
# First parameter is the file that will be created
function encrypt {
    tarfile=$1.tar.xz
    shift
    tar cvJf $tarfile $@ && \
    gpg --cipher-algo AES256 -c $tarfile && \
    shred -u $tarfile
}

#Decrypt a GPG'ed tar into files
function decrypt {
    obj=$1
    tared=`echo $obj|sed 's/\.gpg//'`
    gpg --cipher-algo AES256 -d $obj > $tared && \
    tar xvf $tared && \
    shred -u $tared
}
alias rmforreal="shred --iterations=7 -z --random-source=/dev/urandom"

#
# GTD w/ taskwarrior.
#
alias t="task"
alias tin="task add +in"
alias tadd="task add +next"

# Store thing in tickle file
function tick {
    deadline=$1
    shift
    task add +in +tickle wait:$deadline $@
}

# Print list of open projects
function tpro {
    task -COMPLETED +PENDING projects
}

#
# Work related
#
export OMPSS=$DEV/OmpSs
export MCXX=$OMPSS/mcxx-install/bin
export MCXXB=$OMPSS/mcxx-build
export MCXXS=$OMPSS/mcxx/src
export PARAVER=$OMPSS/wxparaver-4.6.0-linux-x86_64/bin
export MCXX=$OMPSS/mcxx-install/bin
export PATH=$PARAVER:$MCXX:$PATH

alias fmt="cd /home/dpl/dev/FMT"
alias ompss="cd /home/dpl/dev/OmpSs"
alias mcxxi="cd $MCXX/.."
alias mcxxs="cd $MCXXS"
alias mcxxb="cd $MCXXB"
alias mcxxst="cd $MCXXS/../tests"
alias mcxxbt="cd $MCXXB/tests"
alias nanox="cd  $OMPSS/nanox"
alias nanos6="cd $OMPSS/nanos6"

export AXIOM=$DEV/AXIOM
alias axiom="cd $AXIOM"

alias minotauro="ssh bsc15224@mt1.bsc.es"
alias marenostrum="ssh bsc15224@mn1.bsc.es"
alias work="mcxxs && nvim -t ./tags"

function setgcc6 {
    sudo ln -s -b  /usr/bin/gcc-6 /usr/bin/gcc
    sudo ln -s -b  /usr/bin/g++-6 /usr/bin/g++
    sudo ln -s -b  /usr/bin/cpp-6 /usr/bin/cpp
    sudo ln -s -b  /usr/bin/gfortran-6 /usr/bin/gfortran
}
function setgcc5 {
    sudo ln -s -b  /usr/bin/gcc-5 /usr/bin/gcc
    sudo ln -s -b  /usr/bin/g++-5 /usr/bin/g++
    sudo ln -s -b  /usr/bin/cpp-5 /usr/bin/cpp
    sudo ln -s -b  /usr/bin/gfortran-5 /usr/bin/gfortran
}
function setgcc4 {
    sudo ln -s -b  /usr/bin/gcc-4 /usr/bin/gcc
    sudo ln -s -b  /usr/bin/g++-4 /usr/bin/g++
    sudo ln -s -b  /usr/bin/cpp-4 /usr/bin/cpp
    sudo ln -s -b  /usr/bin/gfortran-5 /usr/bin/gfortran
}

