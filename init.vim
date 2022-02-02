" Leader
let g:mapleader=','

" Colemak
nnoremap n j
vnoremap n j

vnoremap N 5j
nnoremap K 5k

map <C-w> <C-W><C-w>

nnoremap ' :
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>cc :sp<CR>
nnoremap <Leader>vv :vsp<CR>

call plug#begin('~/.vim/plugged')

" Colors
" Plug 'dracula/vim', { 'as': 'dracula' }
  set background=dark
  set t_Co=256

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  if (has("termguicolors"))
    set termguicolors
  endif

" Status line
Plug 'itchyny/lightline.vim'
  set laststatus=2

  " Format the status line
  set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

  set noshowmode
  let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


Plug 'kien/ctrlp.vim'
  " nnoremap <space> :CtrlPMRU<CR>

" Set no max file limit
let g:ctrlp_max_files = 0


" Fuzzy Search
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf
  nnoremap <Leader>m :Files<CR>

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
nnoremap <Leader>gg :GV<CR>

call plug#end()

" Mouse
set mouse=""

" Encoding
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Identation
filetype plugin indent on

" Spaces
set tabstop=2
set shiftwidth=2 " identation defaults to 2 spaces"

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Search
set incsearch      " incremental search, search as you type
set hlsearch       " higlight search results
set ignorecase     " ignore case when searching
set smartcase      " ignore case when searching lowercase"
set nocursorline   " do not highlight current line
set nocursorcolumn " do not highlight current column

" Search and replace the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" vimrc file
nnoremap <Leader>vi :tabe $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

" clear the search buffer when hitting return
nnoremap <CR> :nohl<cr>

 " Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Better? completion on command line
set wildmenu
set wildmode=longest,list,full

" (Hopefully) removes the delay when hitting esc in insert mode
" set noesckeys
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0
set notimeout

" Delete in Insert Mode
inoremap <C-h> <Left><Del>

" Emacs-like beginning and end of line.
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>^

" treat :W as :w
cnoremap <expr> W (getcmdtype() is# ':' && empty(getcmdline())) ? 'w' : 'W'

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>

map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c

" Get off my lawn
nnoremap <Left> :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

" Make Y yank to the end of line
nnoremap Y y$

" git blame
" vnoremap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Move visual block up or down easily
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect visual block after indent/outdent indent visual
vnoremap < <gv
vnoremap > >gv

" Edit
"  edit another file in the same directory as the current file
"  uses expression to extract path from current file's path
nnoremap <Leader>f :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" Buffers
" close the current buffer
nnoremap <C-q> :bd<CR>

" better command-line editing
cnoremap <C-f> <right>
cnoremap <C-b> <left>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-d> <del>

" enter command mode with one keystroke
" nnoremap ; :
" nnoremap : ;

" expand path of current file in command mode remapping command-line mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Misc
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set scrolloff=3    " keep more context when scrolling off the end of a buffer
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile
set number
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp  " Don't clutter my dirs up with swp and tmp files
set autowrite         " Save buffer automatically when changing files"
set autoread          " If a file is changed outside of vim, automatically reload it without asking
set guioptions-=T
set guifont=Consolas:h14
set mouse=""

" No annoying sound on errors
set noerrorbells " don't make noise
set novisualbell " don't blink
set t_vb=
set tm=500

set updatecount=10    "Save buffer every 10 chars typed"

 " Keep the cursor in place while joining lines
nnoremap J mzJ`z`

" Force Saving Files that Require Root Permission edit sudo root file tee save
cnoremap w!! %!sudo tee > /dev/null

" Search and replace the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"Always show current position
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Remap VIM 0 to first non-blank character
map 0 ^

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction


map <C-Q> <C-W>

inoremap <C-A> _
inoremap <C-R> :

inoremap <C-Z> <Esc>:q!
nnoremap <C-Z> :q!

nnoremap <C-B> h
nnoremap <C-F> l