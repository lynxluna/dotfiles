execute pathogen#infect()
set nocompatible
set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set background=dark
colorscheme solarized
set cursorline
execute "set colorcolumn=" . join(range(120,335), ',')
syntax on
filetype plugin indent on
set showcmd
set showmode
set hidden
set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase

set number
set ruler

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd VimEnter * NERDTree

nmap <buffer> ,ee :%Eval<CR>
nmap <buffer> ,ef :Eval<CR>
nmap <buffer> ,b :buffers <CR>
nnoremap <F5> "=strftime("%b %d, %Y")"<CR>P

let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]
