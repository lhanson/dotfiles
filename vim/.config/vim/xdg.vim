" Sets up Vim to use directories specified by XDG environment variables as
" defined in the specification:
" https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
"
" Inspired by https://github.com/kaleb/vim-files/blob/master/xdg.vim
"
" Note that this is not necessary for NeoVim as it comes with sane defaults.

if !isdirectory($XDG_DATA_HOME . "/vim/swap")
  call mkdir($XDG_DATA_HOME . "/vim/swap", "p")
endif
set directory=$XDG_DATA_HOME/vim/swap//,/var/tmp//,/tmp//

if !isdirectory($XDG_DATA_HOME . "/vim/backup")
  call mkdir($XDG_DATA_HOME . "/vim/backup", "p")
endif
set backupdir=$XDG_DATA_HOME/vim/backup//,/var/tmp//,/tmp//

" Double slash does not actually work for backupdir, here's a fix
au BufWritePre * let &backupext='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')

" See :help persistent-undo
if !isdirectory($XDG_DATA_HOME . "/vim/undo")
  call mkdir($XDG_DATA_HOME . "/vim/undo", "p")
endif
set undodir=$XDG_DATA_HOME/vim/undo//,/var/tmp//,/tmp//
set undofile

set viminfo+=n$XDG_DATA_HOME/vim/viminfo

set runtimepath-=~/.vim
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath-=~/.vim/after
set runtimepath+=$XDG_CONFIG_HOME/vim/after
