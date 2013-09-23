set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
"colorscheme vividchalk  " Uncomment this to set a default theme
 
" Formatting (some of these are for coding in C and C++)
set sw=2 " no of spaces for indenting
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
 
" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
 

set guioptions-=T  "remove toolbar
set guioptions-=r
colorscheme ir_black 
syntax on


if has("autocmd")
  filetype indent on
endif

" For Pathogen
call pathogen#infect()

let mapleader = ","

" Save all backups here, rather than spreading around the file system.
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" This stuff works with vim-ruby-conque to give me pretty color output.  There
" are cucumber hooks in here as well that I might map later.
map <Leader>r :w<CR>:call RunRubyCurrentFileConque()<CR>
map <Leader>s :w<CR>:call RunRspecCurrentFileConque()<CR>
map <Leader>S :w<CR>:call RunSpecAllFilesConque()<CR>
map <Leader>l :w<CR>:call RunRspecCurrentLineConque()<CR>
map <Leader>R :w<CR>:call RunRakeConque()<CR>
map <Leader>b :call RunBashConque()<CR>
let g:ruby_conque_rspec_command='rspec'
let g:ConqueTerm_InsertOnEnter=0 "Supposed to put me in Normal mode, but it doesn't work?
let g:ConqueTerm_CWInsert = 0 "Able to leave buffer using Command-W

" Enable Python Intellisense
autocmd FileType python set omnifunc=pythoncomplete#Complete

"Make Command T detect newly added files
augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
augroup END
