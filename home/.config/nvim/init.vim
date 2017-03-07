source ~/.config/nvim/init_dein.vim


" --------------------------------------------------------------------------
" Basic configs

set shell=/bin/sh
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark " or dark
colorscheme gruvbox

highlight ExtraWhitespace ctermbg=Brown guibg=Brown
set listchars=eol:$,tab:>-,space:.,trail:~,extends:>,precedes:<
set list

"Is required for file watchers to work (as an example the webpack-dev-server
set backupcopy=yes

set lazyredraw
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
filetype plugin indent on

set clipboard=unnamed

set noerrorbells        " No beeps. 
set modeline            " Enable modeline.
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
" not working!
" set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

" Jump to last position
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" --------------------------------------------------------------------------
" Key bindings

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunction

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>


set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>




nnoremap ; :
nnoremap Q @q 



autocmd BufWritePost,BufEnter * Neomake



inoremap <Esc>   <nop>
inoremap jk <Esc>



" inoremap <Up>    <nop>
" inoremap <Down>  <nop>
inoremap <Left>  <nop>
inoremap <Right> <nop>



" ------------------------------------------------------------------------
" Package configs

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme= 'gruvbox'
let g:airline_powerline_fonts=1

" ------------------------------------------------------------------------
" Standard formatter (disabled)
" let g:neomake_javascript_enabled_makers = ['standard']
" autocmd bufwritepost *.js silent !standard-format -w %
" set autoread

let g:deoplete#enable_at_startup = 1

" Deoplete with flow
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

set wildignore+=*/node_modules/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set wildignore+=*/shop/ProdukteBilder/*,*/shop/ProdukteDetails/*
