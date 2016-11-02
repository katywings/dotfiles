"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.dein-vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin($HOME.'/.dein-vim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add package include here
source ~/.config/nvim/packages.vim

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
