"###############################################################################
" plugins.vim - Plugin management
"###############################################################################

" Managing plugins with dein: https://github.com/Shougo/dein.vim
set runtimepath+=$XDG_DATA_HOME/vim/dein.vim

let s:dein_cache=$XDG_CACHE_HOME . '/vim/dein'

if dein#load_state(s:dein_cache)
  call dein#begin(s:dein_cache)

  " Let dein manage dein
  call dein#add('$XDG_DATA_HOME/vim/dein.vim')

  "##############################
  " Add or remove plugins here: "
  "##############################
  " Intelligently reopen files at your last edit position
  call dein#add('farmergreg/vim-lastplace')

  "To uninstall commented-out/unused plugins:
  "call map(dein#check_clean(), "delete(v:val, 'rf')")
  "call dein#recache_runtimepath()

  call dein#end()
  call dein#save_state()
endif

" install new plugins on startup
if dein#check_install()
  call dein#install()
endif
  
