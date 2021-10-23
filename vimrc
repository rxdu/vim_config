"
"""""""""""""""""""""""""""""""""""""""""""""""""""
"                Vim Configurations
""""""""""""""""""""""""""""""""""""""""""""'""""""
"                  Ruixiang Du
"                  http://rdu.im
"              ruixiang.du@gmail.com
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Reference
" [1] https://dougblack.io/words/a-good-vimrc.html

""" Pathogen 'runtimepath' management
execute pathogen#infect()
call pathogen#helptags()

""" General vim configurations
set nocompatible
filetype on
filetype plugin on

""" UI config
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

""" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

""" Indent settings
filetype indent on
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set hidden

""" Colors and Fonts
syntax enable
colorscheme codedark

""" C.vim
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

""" Spelling check
set spell spelllang=en_us

""" Editor UI
set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set showmatch           " highlight matching [{()}]
set splitbelow
set splitright

""" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

""" Key mapping
:inoremap jj <Esc>
:nnoremap <F8> :TagbarToggle<CR>
:map <C-o> :NERDTreeToggle<CR>
:map <C-i> :ClangFormat<CR>
:nnoremap <c-z> <nop>
"nnoremap <C-N> :bnext<CR>
"nnoremap <C-P> :bprev<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin Configurations
""""""""""""""""""""""""""""""""""""""""""""'""""""

""" Vim-Cpp-Modern
let g:cpp_attributes_highlight = 1

""" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

""" Clang-Format
" let g:clang_format#code_style = "google"
" autocmd FileType c ClangFormatAutoEnable
let g:clang_format#style_options = {
            \ "UseTab": "false",
            \ "IndentWidth" : 4,
            \ "BreakBeforeBraces" : "Allman",
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "IndentCaseLabels": "false",
            \ "ColumnLimit": 0,
            \ "Standard" : "C++11"
            \ }

""" Gutentags
let g:gutentags_project_root = ['Makefile','CMakeLists.txt']
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml', 
                                \'*.ini', '*.rst', '*.md']

""" YouCompleteMe
" let g:ycm_show_diagnostics_ui = 1
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

""" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.gitignore']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

""" Tagbar
let g:tagbar_sort = 0
"let g:tagbar_show_linenumbers = 2

""" NerdTree
" key mapping below

""" Ale
let g:ale_completion_enabled = 1

""" vim-clang
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11'
let g:clang_compilation_database = './build'

"""""""""""""""""""""""""""""""""""""""""""""""""""
"             Addtional Configurations
""""""""""""""""""""""""""""""""""""""""""""'""""""

""" tmux
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

""" lightline
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ], ['ctrlpmark'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

let g:lightline.tabline = {
      \   'left': [ ['tabs'] ],
      \   'right': [ ['close'] ]
      \ }
"set showtabline=2  " Show tabline
"set guioptions-=e  " Don't use GUI tabline

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction
