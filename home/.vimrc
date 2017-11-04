" --------------------------------------------------------------------------
" Basic configs

set shell=/bin/sh
set termguicolors
colorscheme default
set background=dark " light or dark

" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    set clipboard=unnamed
    " Do Mac stuff here
  else
    set clipboard=unnamedplus
  endif
else
  set clipboard=unnamed
endif

set belloff=all
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


" Map the leader key to SPACE
let mapleader="\<SPACE>"

" ------------------------------------------------------------------------
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

" ------------------------------------------------------------------------
" Search enhancements
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

" ; is not useful anyway
nnoremap ; :

" easier shortcut
nnoremap Q @q

" Bind jk to esc
inoremap jk <Esc>

" Can be used to disable the arrow keys
" inoremap <Up>    <nop>
" inoremap <Down>  <nop>
" inoremap <Left>  <nop>
" inoremap <Right> <nop>

" ------------------------------------------------------------------------
" Paths to ignore

set wildignore+=*/.git/*
set wildignore+=*/.csv/*
set wildignore+=*/node_modules/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/shop/ProdukteBilder/*,*/shop/ProdukteDetails/*
