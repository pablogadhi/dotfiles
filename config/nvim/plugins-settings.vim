"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins Settings and Mappings
"
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

"NerdTree
noremap <C-Space> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" Change Working Directory when root folder is changed
let g:NERDTreeChDirMode = 2
" Close NerdTree if it is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

"NerCommenter support for vue.js
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

"AutoFormat
autocmd BufWrite * execute "normal! \mf"
noremap <leader>af :Autoformat<CR>

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:neopairs#enable = 1
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

" Deoplete Debugging
" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', 'deoplete.log')
" call deoplete#custom#source('omnisharp', 'is_debug_enabled', 1)

"Emmet
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
            \  'javascript.jsx' : {
            \      'extends' : 'jsx',
            \  },
            \}

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-y>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Ale
let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = "always"
let g:ale_open_list = 0
let g:ale_linters = {
            \ 'cs': ['OmniSharp'],
            \ 'python': ['pylint'],
            \}
let g:ale_fixers = {
            \'javascript': ['eslint'],
            \'css': ['stylelint'],
            \ 'python': ['autopep8'],
            \}
noremap <leader>gd :ALEGoToDefinition<CR>
noremap <leader>fr :ALEFindReferences<CR>

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

"AutoPairs
let g:AutoPairsShortcutJump = "<leader><M-n>"

"OmniSharp
let g:OmniSharp_timeout = 30
let g:OmniSharp_want_snippet = 1
let g:OmniSharp_server_use_mono = 1

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

"HARD MODE
" let g:hardtime_default_on = 1

"VUE
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
