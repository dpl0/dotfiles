set -xU BLOCKSIZE K
set -xU EDITOR vim
set -xU PAGER less
set -xU LC_CTYPE "en_US.UTF-8"
set -xU GOROOT /usr/lib/go
set -xU GOPATH $HOME/dev/gopath

set -xU CCACHEPATH /usr/lib/ccache
set -xU PLAN9PATH /usr/local/plan9/bin
set -xU RUSTPATH $HOME/.cargo/bin
set -xU CABALPATH $HOME/.cabal/bin
set  PATH "$HOME/bin" $CCACHEPATH $RUSTPATH $PATH "$GOROOT/bin"

alias less "less -R"
alias ls 'ls -F --color=auto'
# alias ls "ls -GF"

alias tm "tmux -2u"
alias tma "tm attach -t"

alias feh "feh -. -Z"
alias slideshow 'feh -. -F -D7'
alias images 'feh -. -F -z -D7'


# Networking
alias wscan "sudo ifconfig wlan0 list scan"
alias tsc "ping google.com"
alias vm "ssh -i ~/.ssh/netperf  dpl@107.191.46.83"
alias vmftp "sftp -i ~/.ssh/netperf  dpl@107.191.46.83"
alias zoo "ssh -i ~/.ssh/netperf  dpl@zoo.FreeBSD.org"

# Useful places
alias tmp 'cd /home/dpl/tmp'
alias dacomp 'cd /home/dpl/dev/DACOMPILER'
alias davm 'cd /home/dpl/dev/DAVM'
alias compiler 'cd /home/dpl/dev/compiler'

#
# Work related
#
set -xU PARAVER /home/dpl/dev/OmpSs/wxparaver-4.6.0-linux86_64/bin
set -xU MCXX /home/dpl/dev/OmpSs/mcxx-install/bin
set PATH $PARAVER $MCXX $PATH

set -xU MCXXB /home/dpl/dev/OmpSs/mcxx-build
set -xU MCXXS /home/dpl/dev/OmpSs/mcxx/src

alias reinstallmcxx 'mcxxb; make -j4 install; cd -'
alias vim 'nvim'

alias fmt 'cd /home/dpl/dev/FMT'
alias ompss 'cd /home/dpl/dev/OmpSs'
alias mcxxi 'cd /home/dpl/dev/OmpSs/mcxx-install'
alias mcxxs 'cd /home/dpl/dev/OmpSs/mcxx/src'
alias mcxxb 'cd /home/dpl/dev/OmpSs/mcxx-build'
alias nanox 'cd /home/dpl/dev/OmpSs/nanox'
alias nanos6 'cd /home/dpl/dev/OmpSs/nanos6'

alias minotauro 'ssh  bsc15224@mt1.bsc.es'
alias marenostrum 'ssh  bsc15224@mn1.bsc.es'

#
# GTD w/ taskwarrior.
#
alias t "task"
alias tin "task add +in"
alias tadd "task add +next"

# Remove greeting
set -xg fish_greeting ""

function tick --description "Store thing in tickle file."
	set deadline $argv[1]
	task add +in +tickle wait:$deadline $argv[2..-1]
end

function tpro --description "Print list of open projects"
	task -COMPLETED +PENDING projects
end

function syncdotfiles --description "Sync dotfiles folder with system dotfiles"
	set -x dotfiles ~/os/dotfiles/
	set -x files ~/.Xresources ~/.Xmodmap ~/.spectrwm.conf ~/.tmux.conf \
		~/.vimrc ~/.xinitrc ~/.xxxterm.conf ~/.zshrc \
		~/.config/fish/config.fish ~/.config/zathura/zathurarc \
		~/.vitunes/vitunes.conf
	cp $files $dotfiles
	pushd $dotfiles
	git add -A; git commit; git push
	popd
end
