" --------------------------------------------------------------------------
" Basic configs

set shell=/bin/sh

" use 16 colors
set t_Co=16

" 256 colors (colors will look wrong sometimes)
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
" set termguicolors

" Fixates background and colorscheme
" set background=dark " light or dark
" colorscheme default

syntax enable

" Better colors
highlight LineNr ctermfg=LightBlue guifg=LightBlue
highlight Normal ctermfg=White guifg=White
highlight Comment ctermfg=Gray guifg=Gray
highlight NonText ctermfg=Cyan guifg=Cyan

" Highlight whitespaces
highlight Whitespace ctermfg=DarkGray guifg=DarkGray
match Whitespace /\s/

" Highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
2match ExtraWhitespace /\s\+$/

set listchars=eol:$,tab:__,space:.,trail:~,extends:>,precedes:<
set list

"Is required for file watchers to work (as an example the webpack-dev-server
set backupcopy=yes

" Getting backspace to work
" (https://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi#11560415)
set backspace=indent,eol,start

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
  "Easier solutions didn't work https://stackoverflow.com/questions/10139972/vim-hasmacunix-or-hasmac-do-not-work
  let s:uname = substitute(system('uname -s'), '\n', '', '')
  if s:uname == "Darwin" || s:uname == "Mac"
    " Do Mac stuff here
    set clipboard=unnamed
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
