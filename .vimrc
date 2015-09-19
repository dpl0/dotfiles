" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"If we press a mayus letter, there's no need to worry 
command! Q q " Bind :Q to :q
command! W w " Bind :W to :w
command! WQ wq " Bind :WQ to :wq

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

"Encoding utf-8
set encoding=utf-8

"Setting console-like gui settings
set guioptions-=R
set guioptions-=L
set guioptions-=r
set guioptions-=l
set guioptions-=T
"set guioptions-=m

"folding settings
"set foldmethod=indent   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use

"Use "," as leader
let mapleader = ","

" This is for vertical indenting
set list
set listchars=trail:\%,tab:\>\-
"set listchars=trail:\·,tab:\.\ 

"Nice menu when pressing tab
set wildmenu

"Search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set showmatch
set hlsearch

"Substitute globally, to override just add "g" to the end :%s///g
set gdefault

"No more silly backups
set backup
set backupdir=~/.vim/backup
set commentstring=//%s

"Add <leader><space> as shortcut to take away search highlight
"Add tab as "%" (jump betwen {[()]}
nnoremap <leader><space> :noh<cr>
"Move through errors when make(ing) stuff. :help cope
nnoremap <leader>s :mksession! session.vim<cr>
nnoremap <leader>m :make<cr>
nnoremap <leader>n :cn<cr> zz
nnoremap <leader>p :cp<cr> zz
nnoremap <tab> %
vnoremap <tab> %

"Non linewise j/k.
"If we have very long lines, just don't go to the next.
nnoremap j gj
nnoremap k gk

"Use <Leader>l to vsplit and change to the other window
nnoremap <leader>l <C-w>v<C-w>l

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
"let g:CommandTCancelMap = ['<ESC>', '<C-c>']
"let g:CommandTCancelMap = <C-c>

"Looks
set autoindent
set number

"Have a nice column at pos 81
let &colorcolumn=join(range(80,80),",")
"See it nicely.
hi ColorColumn ctermbg=235 guibg=#2c2d27

"256 Colors
set t_Co=256
syntax on

"set tabulations to 8 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

"Vundle
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t'
Plugin 'rdnetto/YCM-Generator'
Plugin 'bling/vim-airline'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'nanotech/jellybeans.vim'
Plugin 'wolfpython/cscope_map.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme jellybeans
" Always show the status line.
set laststatus=2
