"###############################################################################
" powerline.vim - Configuration for the powerline plugin
"###############################################################################

" nvim doesn't support powerline yet: https://github.com/powerline/powerline/issues/1287
if !has('nvim')
	if filereadable("/usr/local/lib/python3.6/site-packages/powerline/bindings/vim/plugin/powerline.vim")
		source /usr/local/lib/python3.6/site-packages/powerline/bindings/vim/plugin/powerline.vim
	elseif filereadable("/usr/lib/python3.6/site-packages/powerline/bindings/vim/plugin/powerline.vim")
		source /usr/lib/python3.6/site-packages/powerline/bindings/vim/plugin/powerline.vim
:   endif

	set laststatus=2
	set t_Co=256
endif
