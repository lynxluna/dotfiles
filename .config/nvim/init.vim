if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('scrooloose/nerdtree', {'lazy' : 1, 'on_cmd' : ['NERDTreeToggle','NERDTreeFind','NERDTree']})
  call dein#add('lifepillar/vim-solarized8')
  call dein#add('scrooloose/syntastic', {'lazy' : 1, 'on_ft': ['python', 'ruby', 'perl', 'php', 'sh', 'vim', 'c', 'cpp', 'css', 'dockerfile', 'html', 'xhtml', 'javascript', 'json', 'markdown','yaml', 'xml', 'zsh']})
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('powerline/fonts', {'lazy' : 1, 'build' : './install.sh'})
  call dein#add('tpope/vim-surround', {'lazy' : 1, 'on_map' : ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>CSurround', '<Plug>Ysurround', '<Plug>YSurround', '<Plug>VSurround', '<Plug>VgSurround', '<Plug>Isurround', 'ISurround']})
  call dein#add('tpope/vim-repeat', {'lazy' : 1, 'on_map' : ['.']})
  call dein#add('fatih/vim-go') 
  call dein#add('kien/ctrlp.vim')
  call dein#add('tpope/vim-sensible')
  if executable('git')
        call dein#add('mhinz/vim-signify')
        call dein#add('tpope/vim-fugitive')
  endif

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " NerdTree {
        "map <C-e> <plug>NERDTreeTabsToggle<CR>
        "map <leader>e :NERDTreeFind<CR>
        map <leader>e :NERDTreeToggle<CR>
        "nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
" }

  call dein#end()
  call dein#save_state()
endif

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
colorscheme solarized8

filetype plugin indent on
syntax enable

set tags=tags;/,codex.tags;/
set number
set relativenumber
set nocompatible
set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cursorline
execute "set colorcolumn=" . join(range(120,335), ',')
set showcmd
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set clipboard=unnamed

set ignorecase
set smartcase

set number
set ruler
set nowrap
set incsearch
set mouse=a
set history=1000
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set cmdheight=1
set encoding=utf-8

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost BUCK set filetype=python
autocmd BufNewFile,BufReadPost Fastfile set filetype=ruby
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

let g:templates_no_autocmd = 1

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:elm_syntastic_show_warnings = 1

