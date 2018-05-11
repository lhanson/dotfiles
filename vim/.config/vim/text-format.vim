"###############################################################################
" text-format.vim - Indentation, whitespace, visual formatting
"###############################################################################

" Indentation with purely hard tabs
set shiftwidth=4
set tabstop=4

" Don't wrap long lines by default
set nowrap

" Show whitespace characters
set list
if has("multi_byte")
	" enable Unicode
	set encoding=utf-8
	setglobal fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,latin1
	" show tabs and line endings
	set listchars=tab:▸\ ,eol:¬
endif

" Highlight first character over the line limit
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
