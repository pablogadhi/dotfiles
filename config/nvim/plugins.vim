"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
" Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'
Plug 'dylanaraps/wal.vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] }
" Plug 'chiel92/vim-autoformat'
" Plug 'othree/html5.vim', { 'for': 'html' }
" Plug 'ap/vim-css-color', { 'for' : 'css' }
" Plug 'hail2u/vim-css3-syntax', { 'for' : 'css' }
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'valloric/youcompleteme', {'do': 'python install.py --all'}
" if has('nvim')
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
    " Plug 'Shougo/deoplete.nvim'
    " Plug 'roxma/nvim-yarp'
    " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'zchee/deoplete-jedi', { 'for': ['python', 'markdown'] }
" Plug 'wokalski/autocomplete-flow', { 'for': ['javascript', 'javascript.jsx' ] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'isRuslan/vim-es6', { 'for': ['javascript', 'javascript.jsx' ] }
" Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx' ] }
" Plug 'justinj/vim-react-snippets'
" Plug 'shougo/neopairs.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
" Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'eugen0329/vim-esearch'
Plug 'takac/vim-hardtime'

call plug#end()
