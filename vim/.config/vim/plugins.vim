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
  " Match wal theme
  call dein#add('dylanaraps/wal.vim')
  " Colorize color codes
  call dein#add('lilydjwg/colorizer')
  " Commenting plugin
  call dein#add('tpope/vim-commentary')
  " Clojure development
  call dein#add('tpope/vim-fireplace.git')
  if has('nvim')
    " nvim doesn't support powerline yet: https://github.com/powerline/powerline/issues/1287
    call dein#add('vim-airline/vim-airline')
  else
    call dein#add('powerline/powerline')
  endif


  "To uninstall commented-out/unused plugins:
  "call map(dein#check_clean(), "delete(v:val, 'rf')")
  "call dein#recache_runtimepath()

  call dein#end()
  call dein#save_state()
endif

" Install new plugins on startup
if dein#check_install()
  call dein#install()
endif
