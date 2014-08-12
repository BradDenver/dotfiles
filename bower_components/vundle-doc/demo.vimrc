" Vundle

filetype on

" Plugins
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

" Vundle installed
Bundle 'file:///home/gmarik/path/to/plugin'
Plugin 'git://git.wincent.com/command-t.git'
Bundle 'gmarik/vundle'
"Bundle 'mileszs/ack.vim'
Bundle 'bling/vim-airline'
"Bundle 'vim-scripts/ZoomWin'
Bundle 'kien/ctrlp.vim'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
"Bundle 'SirVer/ultisnips'
"Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tomtom/tcomment_vim'
"Bundle 'tpope/vim-abolish'
Bundle 'mattn/emmet-vim'
"Bundle 'tpope/vim-dispatch'
Bundle 'godlygeek/tabular'
Bundle 'taglist.vim'
"Bundle 'Valloric/YouCompleteMe'
" Bundle 'marijnh/tern_for_vim'
Bundle 'mhinz/vim-startify'

" Syntax
Bundle 'pangloss/vim-javascript'
"Bundle 'alunny/pegjs-vim'
"Bundle 'nono/vim-handlebars'
"Bundle 'wavded/vim-stylus'
"Bundle 'fsouza/go.vim'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'digitaltoad/vim-jade'
"Bundle 'wting/rust.vim'
"Bundle 'guns/vim-clojure-static'

" Color Schemes
"Bundle 'jaywilliams/vim-vwilight'
"Bundle 'chriskempson/base16-vim'
"Bundle 'nanotech/jellybeans.vim'
"Bundle 'morhetz/gruvbox'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ap/vim-css-color'

filetype plugin indent on
syntax enable
set background=dark
"let g:solarized_termtrans = 1
let g:solarized_termcolors=16
let g:solarized_contrast="high"
colorscheme solarized

au WinLeave * set nocursorline
au WinEnter * set cursorline

" recognize .md files as markdown
au BufRead,BufNewFile *.md set filetype=markdown

set cursorline
hi CursorLineNR cterm=bold, ctermfg=2
hi LineNR ctermbg=none

set showcmd
set autoindent
set foldmethod=manual
set showmatch
set smarttab
set clipboard=unnamed
set mouse=a
set wildignore+=node_modules,javascripts-built,bower_components,test-result
set ruler
set wildmenu
set incsearch
set autoread
set gdefault " always use g flag in s///

" Gutter
set number
set hlsearch

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set laststatus=2
set shiftround

" Store swapfiles and backup files in .vim/tmp
set dir=~/.vim/tmp
set backupdir=~/.vim/tmp

" Mappings
let mapleader=',' " use , for leader instead of backslash

nmap <leader>w <C-W>

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#show_buffers = 0

let user_emmet_expandabbr_key='<C-e>'
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.svn$']
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let Tlist_Show_One_File=1

let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

map <leader>d :NERDTreeToggle<CR>
map <leader>D :NERDTreeFocus<CR>
map <leader>v :vs<CR>

nnoremap <silent> <leader>/ :nohlsearch<CR> " Unhighlight search results
map \ :TComment<cr>
vmap \ :TComment<cr>gv

set noerrorbells

nnoremap j gj
nnoremap k gk
