" neovim configuration


execute pathogen#infect()

set noswapfile
set nobackup
set nowritebackup

set splitbelow
set splitright

" set number
set ruler
set cursorline

set wrap
set scrolloff=3

set autoindent
set nosmartindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set smarttab

set visualbell

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors
set background=dark
colorscheme NeoSolarized
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 0
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

" vim-better-whitespace plugin
let g:better_whitespace_enabled=1
let g:show_spaces_that_precede_tabs=1
