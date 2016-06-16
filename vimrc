""""""""""""""""""""""""""""""""""""""""""""""""""""
"                Vim Configurations
""""""""""""""""""""""""""""""""""""""""""""'""""""'
"                  Ruixiang Du
"                  http://rdu.im
"              ruixiang.du@gmail.com
""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Pathogen 'runtimepath' management
execute pathogen#infect()
call pathogen#helptags()

""" Colors and Fonts
syntax on

""" Editor UI
set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set showmatch           " highlight matching [{()}]

""" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

""" C++ Enhanced Highlight
let c_no_curly_error = 1
" let g:cpp_class_scope_highlight = 1

""" Clang-Format
" g:clang_format#code_style "llvm, google, chromium, mozilla
