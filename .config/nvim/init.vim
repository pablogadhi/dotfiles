"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular', { 'on': ['Tab', 'Tabularize'] }
Plug 'plasticboy/vim-markdown' ,{ 'for': 'markdown'}
Plug 'tpope/vim-repeat'
Plug 'dylanaraps/wal.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] }
Plug 'chiel92/vim-autoformat'
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'https://gitlab.com/mixedCase/deoplete-omnisharp.git', { 'for': 'cs' }
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'ap/vim-css-color', { 'for' : 'css' }
Plug 'hail2u/vim-css3-syntax', { 'for' : 'css' }
Plug 'brooth/far.vim'
Plug 'mhinz/vim-startify'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx' ] }
Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6', { 'for': ['javascript', 'javascript.jsx' ] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx' ] }
Plug 'justinj/vim-react-snippets'
Plug 'shougo/neopairs.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
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
set so=15

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
set completeopt=menuone

"Se code folding method
"set foldmethod=indent

"Set max folding nested levels
"set foldnestmax=3

"Set folding column 'size'
"set foldcolumn=1

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

"Save as root with :W!
command WS w !sudo tee "%" > /dev/null

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set t_Co=16
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi CursorLine term=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
colorscheme wal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linewise up and down movement
nmap j gj
nmap k gk

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>

"Better movement between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

"Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

"Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"Indent and put cursor between with Ctrl-Enter
inoremap [13;5u <CR><CR><Up><Tab>

"Exit from emulated terminal with ESC
tnoremap <C-E> <C-\><C-n>

"Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

"Disable W command
map W <Nop>

"Add numbered up and down movements to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Toggle Folds
nnoremap <Space> za
vnoremap <Space> zf

" No hlsearch
nnoremap <leader>nh :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings and Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Airline
let g:airline_theme = 'term'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '並'

"CtrlP
" let g:ctrlp_cmd = 'CtrlPBuffer'

" FZF
noremap ; :Buffers<CR>
noremap <C-P> :Files<CR>
noremap <leader>t :Tags<CR>
noremap <leader>f :Ag<Space>

" Match FZF with colorscheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

"NerdTree
noremap <C-Space> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"NerdTree Git Plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "",
            \ "Staged"    : "",
            \ "Untracked" : "濫",
            \ "Renamed"   : "",
            \ "Unmerged"  : "",
            \ "Deleted"   : "",
            \ "Dirty"     : "",
            \ "Clean"     : "",
            \ 'Ignored'   : "﬒",
            \ "Unknown"   : "?"
            \ }

"DevIcons
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

"Tagbar
noremap <M-Space> :TagbarToggle<CR>

"Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"AutoFormat
autocmd BufWrite * execute "normal! \mf"
noremap [13;69 :Autoformat<CR>

"Omnisharp
let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_path = '/home/gadhi/builds/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:neopairs#enable = 1
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

"Emmet
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
            \  'javascript.jsx' : {
            \      'extends' : 'jsx',
            \  },
            \}

" NeoSnippets
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-Y>     <Plug>(neosnippet_expand_or_jump)
smap <C-Y>     <Plug>(neosnippet_expand_or_jump)
xmap <C-Y>     <Plug>(neosnippet_expand_target)

" Disable Runtime Snippets
let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }

" Custom snippets
let g:neosnippet#snippets_directory='/home/gadhi/.local/share/nvim/plugged/vim-snippets/snippets'

" Conceal markers
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Expand the completed snippet trigger by <CR>.
" imap <expr><CR>
" \ (pumvisible() && neosnippet#expandable()) ?
" \ "\<Plug>(neosnippet_expand)" : "\<CR>"

"Clear markers when leaving insert mode
autocmd InsertLeave * NeoSnippetClearMarkers

" UltiSnips
" let g:UltiSnipsExpandTrigger="<c-y>"
" let g:UltiSnipsJumpForwardTrigger="<c-y>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Ale
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_fixers = {
            \'javascript': ['eslint'],
            \'css': ['stylelint'],
            \}
noremap <leader>[13;69 :ALEFix<CR>
noremap <leader>gd :ALEGoToDefinition<CR>
noremap <leader>fr :ALEFindReferences<CR>

"Path for unity
let g:ale_cs_mcsc_assemblies = [
            \ '/home/gadhi/Unity-2018.1.6f1/Editor/Data/Managed/UnityEngine.dll',
            \ '/home/gadhi/Unity-2018.1.6f1/Editor/Data/Managed/UnityEngine/UnityEngine.UIModule.dll',
            \]

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

"AutoPairs
let g:AutoPairsShortcutJump = "<leader><M-n>"

"Deoplete-TernJs
let g:deoplete#sources#ternjs#tern_bin = '/home/gadhi/builds/tern/bin/tern'
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#filetypes = [
            \ 'jsx',
            \ 'javascript.jsx',
            \ ]

"JSX
let g:jsx_ext_required = 0
