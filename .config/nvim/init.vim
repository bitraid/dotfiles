" neovim configuration

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
set virtualedit=all

set autoindent
set nosmartindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set smarttab
autocmd Filetype sh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype zsh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype grub setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

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

" highlight column 80 and columns 120 and onward
let &colorcolumn="80,".join(range(120,999),",")

" vim-better-whitespace plugin
let g:better_whitespace_enabled=1
let g:show_spaces_that_precede_tabs=1

let g:airline_theme='solarized'
