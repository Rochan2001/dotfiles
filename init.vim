let g:mapleader = "\<Space>"
syntax enable

"Always show the status bar
set laststatus=2

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
set clipboard=unnamedplus
set mouse=a
set background=dark
set noshowmode
set nohlsearch
set signcolumn=yes
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
"set cursorline                          " Enable highlighting of the current line
"set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set encoding=UTF-8

call plug#begin()

"Vscode like auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"File tree
Plug 'preservim/nerdtree'
"Showing git changes
Plug 'airblade/vim-gitgutter'
"Theme and statusline
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
"Git integeration
Plug 'tpope/vim-fugitive'
"Comment code
Plug 'tpope/vim-commentary'
"Tmux
Plug 'christoomey/vim-tmux-navigator'
"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
"Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

" let g:airline_powerline_fonts = 1 "enable arrow look
let g:airline#extensions#whitespace#enabled = 0 "remove trailing white spaces
" let g:airline_section_z = '%3p%%  %l/%L:%c'
let g:airline_section_z = '%3p%%  %l/%L:%c'
"KeyMaps

"Tabs
nmap te :tabedit 
nmap <S-h> :tabprev<Return>
nmap <S-l> :tabnext<Return>

"Move lines in visual mode
vnoremap <silent> <s-J> :m '>+1<CR>gv=gv
vnoremap <silent> <s-K> :m '<-2<CR>gv=gv

"Normal mode
inoremap jk <ESC>
inoremap kj <ESC>

"Fix Y behaviour
nnoremap Y yg$

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

"NerdTree remapping
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" don't give |ins-completion-menu| messages.
set shortmess+=c
"Remap rename
nmap <F2> <Plug>(coc-rename)

"Coc extensions array
let g:coc_global_extensions = ['coc-json', 'coc-pairs', 'coc-eslint', 'coc-prettier', 'coc-css', 'coc-tsserver', 'coc-java']

autocmd FileType * let b:coc_pairs_disabled = ["<"]


"Prettier format
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <C-p> :GFiles<CR>
map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>h :History<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Vim fugitive
nmap <leader>gs :G<CR>
"------------------------------
