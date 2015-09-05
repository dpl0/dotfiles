set -xU PATH "$HOME/bin" $PATH

set -xU BLOCKSIZE K
set -xU EDITOR vim
set -xU PAGER less
set -xU PLAN9 /usr/local/plan9/
set -xU LC_CTYPE "en_US.UTF-8"

alias j "jobs -l"
alias ls "ls -GF"
alias la "ls -a"
alias lf "ls -A"
alias ll "ls -lA"

alias tma "tm attach -t"
alias tm "tmux -2u"
alias feh "feh -. -Z"
alias less "less -R"

alias tsc "ping google.com"

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

# OPAM configuration
eval (opam config env)

