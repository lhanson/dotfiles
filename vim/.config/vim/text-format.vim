"###############################################################################
" text-format.vim - Indentation, whitespace, visual formatting
"###############################################################################

set tabstop=4

" show whitespace characters
set list
if has("multi_byte")
	" enable Unicode
	set encoding=utf-8
	setglobal fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,latin1
	" show tabs and line endings
	set listchars=tab:▸\ ,eol:¬
endif

" show right margin
set colorcolumn=80
