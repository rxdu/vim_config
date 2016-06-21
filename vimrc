""""""""""""""""""""""""""""""""""""""""""""""""""""
"                Vim Configurations
""""""""""""""""""""""""""""""""""""""""""""'""""""'
"                  Ruixiang Du
"                  http://rdu.im
"              ruixiang.du@gmail.com
""""""""""""""""""""""""""""""""""""""""""""""""""""

""" General vim configurations
filetype on
filetype plugin on

""" Indent settings
filetype indent on
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

""" Pathogen 'runtimepath' management
execute pathogen#infect()
call pathogen#helptags()

""" Colors and Fonts
syntax enable 
"let g:cpp_experimental_template_highlight = 1
"set background=dark
"colorscheme colorsbox-material

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

""" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

""" C++ Enhanced Highlight
let c_no_curly_error = 1
" let g:cpp_class_scope_highlight = 1

""" Clang-Format
" g:clang_format#code_style "llvm, google, chromium, mozilla
autocmd FileType c ClangFormatAutoEnable

""" Gutentags
let g:gutentags_project_root = ['Makefile','CMakeLists.txt']

""" YouCompleteMe
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

""" Key mapping
:inoremap jj <Esc>
