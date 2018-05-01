"###############################################################################
" powerline.vim - Configuration for the powerline plugin
"###############################################################################

if has('nvim')
	" nvim doesn't support powerline yet: https://github.com/powerline/powerline/issues/1287
else
	source /usr/local/lib/python3.6/site-packages/powerline/bindings/vim/plugin/powerline.vim
	set laststatus=2
	set t_Co=256
endif
