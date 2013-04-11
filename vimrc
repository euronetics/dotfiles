" disable compability with vi
set nocompatible

" smart autoindentaiton
set backspace=indent,eol,start
set autoindent
set smartindent
set cinkeys=0{,0},0):,0#,!^I,o,O,e


" display incomplete command
set showcmd

" display ruler
set ruler

" tab configuration
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Trim trailing whitespace
fun! <SID>StripWhite()
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun
autocmd BufWritePre * :call <SID>StripWhite()

" disable annoying sounds at error, blink instead
set noerrorbells
set visualbell
set t_vb=

" search while i type.
set incsearch

" dark background
set background=dark

" color dependent settings
if &t_Co > 1 || has("gui_running")
  syntax enable " enable syntax high
  set hlsearch " higlight search items
endif

" reset syntax colors
syntax reset

" display linenumbers
set number

" map Ctrl-A and Ctrl-E to emacs mode. map! makes
" the mapping work in all vim modes
map  <C-A> <Home>
map  <C-E> <End>
map! <C-A> <Home>
map! <C-E> <End>

map  <BS> <C-H>
map! <BS> <C-H>

" set status line information
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

" detect filtype plugins and indentation files
filetype plugin indent on

