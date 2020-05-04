"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" General Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Encoding
set encoding=utf-8

"Enable mouse support
set mouse=a

"Enable clipboard support
"set clipboard+=unnamedplus

"Enable filetype detection and plugins
filetype plugin indent on

"Set mapleader key
let mapleader = ","

"Enable syntax highlighting
syntax on

"Auto read external file changes
set autoread

"Remember more lines
set history=10000

"More undo levels
set undolevels=1000

"Set lines after and before cursor when scrolling
set so=5

"Set line numbers
set number

"Show line numbers relative to the current line
set relativenumber

"Show current position
set ruler

"Highlight line currently under the cursor
set cursorline

"Use spaces instead of tabs
set expandtab

"Enable smart tabs
set smarttab

"Set tabs width
set shiftwidth=4
set tabstop=4

"Enable auto indent and smart indent
set autoindent
set smartindent

"Round indents to the nearest multiple of shift width
set shiftround

"Wrap lines
set wrap

"Do not wrap a line in the middle of a word
set linebreak

"Ignore case when searching
set ignorecase

"Enable smart case searching
set smartcase

"Highlight search results
set hlsearch

"Enable incremental search
set incsearch

"Enable Wildmenu
set wildmenu

"Hide buffer instead of closing it
set hidden

"Do not redraw when executing macros
set lazyredraw

"Turn magic on for regular expressions (I don't know how to use them though,
"jeje)
set magic

"Show matching brackets
set showmatch

"Display file title
set title

"Enable spell checking
"set spell
set spelllang=en_us

"Split vertical window to the right
set splitright

"Improve completition popup
set completeopt=longest,menuone
set completeopt-=preview

"Se code folding method
set foldmethod=manual

"Set max folding nested levels
set foldnestmax=3

"Set folding column 'size'
set foldcolumn=0

"Make undo persistent (You can undo even after closing Vim)
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Start in the last line where the file was closed
au BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif

"Save as root with :WS
command! WS w !sudo tee "%" > /dev/null

"Improve startup speed in neovim
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let g:ruby_host_prog = '/home/gadhi/.gem/ruby/2.5.0/bin/neovim-ruby-host'
let g:ruby_host_skip_check = 1
let g:node_host_prog = '/usr/bin/neovim-node-host'
let g:node_host_skip_check = 1

" Open help in vertical windows
cabbrev h vert h

" Resize QuickFix window height Automatically
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$")+2, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Close QuickFix window if its the last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="quickfix"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction
