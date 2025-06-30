set laststatus=2
set clipboard=unnamed " in osx it is unnamed not unnamedplus


"Sane editing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set autoindent
"set colorcolumn=80

set nu
set relativenumber
set guicursor=
set autoread
set ignorecase
set smartcase
set incsearch
set hidden
set noerrorbells
set nowrap
set scrolloff=8
set background=dark
set noshowmode
set nohlsearch
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set cursorline                          " Enable highlighting of the current line

call plug#begin()

"File tree
"Theme and statusline
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

"Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme gruvbox-material

" let g:airline_powerline_fonts = 1 "enable arrow look
let g:airline#extensions#whitespace#enabled = 0 "remove trailing white spaces
" let g:airline_section_z = '%3p%%  %l/%L:%c'
let g:airline_section_z = '%3p%%  %l/%L:%c'

"Tabs
nmap te :tabedit
nmap <S-h> :tabprev<Return>
nmap <S-l> :tabnext<Return>

"Move lines in visual mode
vnoremap <silent> <s-J> :m '>+1<CR>gv=gv
vnoremap <silent> <s-K> :m '<-2<CR>gv=gv

"Normal mode
inoremap jk <ESC>
inoremap jj <ESC>

"Fix Y behaviour
nnoremap Y yg$

nmap H ^
nmap L $

"Fix indenting visual block
vmap < <gv
vmap > >gv

" Split window
nnoremap sv <C-w>v
nnoremap sh <C-w>s

"keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
