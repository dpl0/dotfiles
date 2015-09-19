set -xU BLOCKSIZE K
set -xU EDITOR vim
set -xU PAGER less
set -xU PLAN9 /usr/local/plan9/
set -xU LC_CTYPE "en_US.UTF-8"

set -xU PATH "$HOME/bin" $PATH "$PLAN9/bin"

alias j "jobs -l"
alias ls "ls -GF"
alias la "ls -a"
alias lf "ls -A"
alias ll "ls -lA"

alias tma "tm attach -t"
alias tm "tmux -2u"
alias feh "feh -. -Z"
alias less "less -R"
alias wscan "sudo ifconfig wlan0 list scan"

alias tsc "ping google.com"
alias triton "ssh -N -f -L 2222:arctic.cmima.csic.es:22 peyrolon@triton.cmima.csic.es"
alias arctic "ssh peyrolon@localhost -p 2222"
alias vm "ssh -i ~/.ssh/netperf  dpl@107.191.46.83"
alias vmftp "sftp -i ~/.ssh/netperf  dpl@107.191.46.83"
alias zoo "ssh -i ~/.ssh/netperf  dpl@zoo.FreeBSD.org"

#
# GTD w/ taskwarrior.
#
alias t "task"
alias tin "task add +in"
alias tadd "task add +next"

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
		~/.config/fish/config.fish ~/.config/zathura/zathurarc
	cp $files $dotfiles
end
