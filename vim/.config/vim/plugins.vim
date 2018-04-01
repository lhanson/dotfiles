"###############################################################################
" plugins.vim - Plugin management
"###############################################################################

" Managing plugins with dein: https://github.com/Shougo/dein.vim
set runtimepath+=/home/ldh/.local/share/vim/dein.vim

if dein#load_state('/home/ldh/.cache/dein')
  call dein#begin('/home/ldh/.cache/dein')

  " Let dein manage dein
  call dein#add('/home/ldh/.local/share/vim/dein.vim')

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
  
