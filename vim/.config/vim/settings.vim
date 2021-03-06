"###############################################################################
" settings.vim - Basic, high-level settings
"###############################################################################
if &compatible
	set nocompatible               " Be iMproved
endif

" Leader
let mapleader = ","

" Buffer navigation
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" Store netrw history in the cache directory
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

" Enable filetype detection, plugin loading, and indentation
filetype plugin indent on
" Enable syntax highlighting
syntax enable
" Enable switching buffers without saving the current one
set hidden

" Show line numbers
if exists("+relativenumber")
	set relativenumber
else
	set number
endif
