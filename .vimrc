" ININIT'S VIM CONFIG FILE

"""""""""""""""""""" LINKS / DOCS """"""""""""""""""""

" Unused keys
" https://vim.fandom.com/wiki/Unused_keys

" Remember
" Motions / text objects:
"   {  }  p - Paragraphs (begin, end, whole)
"   % - Matching braces
" Registers ( " or <C-r> ):
"   "   - Unnamed 
"   0-9 - Numbered
"   a-z - Named
"   +   - Clipboard contents
"   *   - Clipboard contents (mouse selection)
"   .   - Last inserted text
"   %   - Current file relative path
"   :   - Last ex command
"   =   - Insert result of expression here
"   /  ?  *  # - Last searched term
" Commands:
"   m  '  ` - Marks (put, jump to line, jump to exact location)
"   *  #    - Search current word forward/backward
"   '.  `.  - Jump to last edited line/position
"   ''  ``  - Jump to line/position before jump
"   g;  g,  - Jump backward/forward on change list
"   ==      - Fix indentation
"""""""""""""""""""" THEME """""""""""""""""""""""""""

set background=dark
colorscheme solarized
let g:solarized_termtrans=1

"""""""""""""""""""" COMPATIBILITY """"""""""""""""""""

" Ignore compatibility to old vi
set nocompatible

" Map <Leader> key to <Space>
let mapleader=' '

"""""""""""""""""""" APPEARANCE """"""""""""""""""""

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable syntax highlight
syntax on

" Highlight matching brace
set showmatch

" Show line numbers
set number

" Highlight current line
set cursorline

" Show the cursor position
set ruler

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Do not wrap lines
set nowrap

" Keep 3 lines when scrolling
set scrolloff=3

" Always show status line
set laststatus=2

" Use visual bell (no beeping)
set visualbell

" Satus line indicates insert or normal mode
set showmode

" Set status line display
set statusline=%.40f\ %m%r%h%w\ %=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%3l,%-3v]\ [BUFFER=%n]

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

"""""""""""""""""""" COMMAND LINE """"""""""""""""""""

" Show partial commands
set showcmd

" Up to 2 lines of command 'line', to avoid 'press <Enter> to continue'
set cmdheight=2

" Better tab completion in the commandline
set wildmenu

" List all matches and complete to the longest match.
set wildmode=list:longest  

" Confirm dialog for commands that requires saving
set confirm

"""""""""""""""""""" SEARCHING """"""""""""""""""""

" Highlight all search results
set hlsearch

" Searches are case-insensitive
set ignorecase

" But respect case if term contais upper-case letters
set smartcase

" Use incremental search
set incsearch

"""""""""""""""""""" INDENTING """"""""""""""""""""

" Use current indent for new lines
set autoindent

" By default, indent with spaces instead of tabs (softtab)
set expandtab

" Size of a hard tab
set tabstop=2

" Size of a soft tab (spaces)
set softtabstop=4

" Size of a shift left/right (indent/unindent cmd)
set shiftwidth=4

" Let plugins override indentation settings
filetype plugin indent on

" Backspace can un-indent
set backspace=indent,eol,start

"""""""""""""""""""" BUFFERS, TABS, WINDOWS """"""""""""""""""""

" Allows switching from an unsaved buffer
set hidden

" Always show tab bar
set showtabline=2

" New windows appear on right or bottom
set splitright
set splitbelow

"""""""""""""""""""" AUTO SAVE AND READ """"""""""""""""""""

" Reload files changed outside of vim
set autoread

" Choose when to look for file changes to reload
au FocusGained,BufEnter * :silent! !

" Set backup directory
set backupdir=$HOME/.vim/tmp/backup

" Set swap directory
set dir=$HOME/.vim/tmp/swap

" Create those directories, if they does't exist
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
if !isdirectory(&dir)       | call mkdir(&dir, 'p', 0700)       | endif

"""""""""""""""""""" ABBREVIATIONS """"""""""""""""""""

" Exit ignoring case
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev WQ wq

"""""""""""""""""""" MAPPINGS """"""""""""""""""""

" Fix inconsistencies
noremap Y      y$
noremap x      "_x
noremap X      "_X
noremap <Del>  "_x
noremap <BS>   "_X

" Avoid reaching Home, End, PgUp, PgDown
noremap H  ^
noremap L  $
noremap K  <C-u>
noremap J  <C-d>

" Avoid reaching Esc (testing CAPS as ESC)
"" inoremap jk <Esc>
"" inoremap kj <Esc>

" Clean search (highlight)
nnoremap <silent> <leader>c :noh<cr>

" Maintain Visual Mode after shifting with > and <
vmap < <gv
vmap > >gv

" Clipboard related
noremap <Leader>y "+y
noremap <Leader>p "+p

" Tabs related
noremap <Leader>tt  :tabs<CR>:tabn<Space>
noremap <Leader>te  :tabedit<Space>
noremap <Leader>tc  :tabclose<CR>
noremap <Leader>to  :tabonly<CR>
noremap <Leader>tn  :tabn<CR>
noremap <Leader>tp  :tabp<CR>

" Windows related
noremap <Leader>ww  <C-w>w
noremap <Leader>we  :vsplit<CR>
noremap <Leader>wp  :vertical sbprevious<CR>
noremap <Leader>ws  :split<CR>
noremap <Leader>wd  :sbprevious<CR>
noremap <Leader>wr  <C-w>r
noremap <Leader>wc  :close<CR>
noremap <Leader>wo  <C-w>o

" Buffers related
noremap q :q<CR>
noremap s :buffers<CR>:buffer<Space>
noremap <Leader>bb  :buffers<CR>:buffer<Space>
noremap <Leader>bn  :bnext<CR>
noremap <Leader>bp  :bprevious<CR>

" Pending
" Vim Unimpaired
" New mappings for macros
