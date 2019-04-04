"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins Settings and Mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
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

" FZF
noremap ; :Buffers<CR>
noremap <C-P> :Files<CR>
noremap <leader>t :Tags<CR>
noremap <leader>ag :Ag<CR>

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

" NerdTree
noremap <C-Space> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" Change Working Directory when root folder is changed
let g:NERDTreeChDirMode = 2
" Close NerdTree if it is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NerdTree Git Plugin
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

" DevIcons
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Tagbar
noremap <M-Space> :TagbarToggle<CR>

" Nerd Commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

nmap <C-_>   <Plug>NERDCommenterToggle
" nmap <C-s-_>   <Plug>NERDComSexyComment
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" vmap <C-s-_>   <Plug>NERDComSexyComment<CR>gv

" NerCommenter support for vue.js
let g:ft = ''
function! NERDCommenter_before()
    if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
            let syn = synIDattr((stack)[0], 'name')
            if len(syn) > 0
                exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
            endif
        endif
    endif
endfunction
function! NERDCommenter_after()
    if g:ft == 'vue'
        setf vue
        let g:ft = ''
    endif
endfunction

" AutoFormat
" autocmd BufWrite * execute "normal! \mf"
" noremap <leader>af :Autoformat<CR>

" Emmet
let g:user_emmet_leader_key='<tab>'
let g:user_emmet_settings = {
            \  'javascript.jsx' : {
            \      'extends' : 'jsx',
            \  },
            \}

" Ale
let g:ale_completion_enabled = 0
let g:ale_open_list = 0
let g:ale_fix_on_save = 1

noremap <leader>gd :ALEGoToDefinition<CR>
noremap <leader>fr :ALEFindReferences<CR>
noremap <leader>af :ALEFix<CR>

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
    \'vue': ['eslint', 'vls']
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'vue': ['eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

" COC
let g:coc_snippet_next = '<C-Y>'
let g:coc_snippet_prev = '<C-B>'
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<tab>"

" YouCompleteMe
" let g:ycm_python_interpreter_path = ''
" let g:ycm_python_sys_path = []
" let g:ycm_extra_conf_vim_data = [
"   \  'g:ycm_python_interpreter_path',
"   \  'g:ycm_python_sys_path'
"   \]
" let g:ycm_global_ycm_extra_conf = '~/.ymc_global_conf.py'
" let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-y>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"HARD MODE
" let g:hardtime_default_on = 1

"VUE
" let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
