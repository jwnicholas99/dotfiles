
"""" Basic Behaviour

set nocompatible                   " Switches from default Vi and enables useful Vim functionality
set shortmess+=I                   " Disable the default Vim startup message.
set number                         " Show line numbers.
set wrap                           " Wrap lines
set relativenumber                 " Set relative line numbering mode
set backspace=indent,eol,start     " Make backspace more intuitive
set laststatus=2                   " Always show statusline (even with only one window)
syntax on                          " Set syntax hightlighting on
set hidden                         " Allow for buffers to be hidden
set noerrorbells visualbell t_vb=  " Disable annoying bell
set mouse+=a                       " Enable mouse support
set encoding=UTF-8                 " This ensures that encoding is UTF-8
set wildmenu                       " Display all matching files when tab


"" Key Bindings

let mapleader=","
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap <C-j> :m .+1<CR>|         " Modifies <C-j> to shift line down
nnoremap <C-k> :m .-2<CR>|         " Modifies <C-k> to shift line up 
nnoremap <F5> :buffers<CR>:buffer<Space>|  " Change F5 to show buffer menu
noremap <Esc>k :wincmd k<CR>|      " Modifies <Esc>_ to switch windows easily
noremap <Esc>j :wincmd j<CR>
noremap <Esc>h :wincmd h<CR>
noremap <Esc>l :wincmd l<CR>
map <leader>b :b#<CR>         " Switch to prev buffer
nnoremap <leader>q :bp\|bd #<CR>      " C



"" Tab Settings

set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')



"""" Search Settings

set ignorecase                     " This makes search case-insensitive
set smartcase                      " This makes search case-sensitive if it contains any capital letters
set incsearch                      " This enables searching as you type
set hlsearch                       " This highlights matches 



"""" Plugins

"" Automatically install junegunn plugin manager if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"" List of plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://github.com/maxbrunsfeld/vim-yankstack'
Plug 'ryanoasis/vim-devicons'

call plug#end()


"" Settings for each plugin

" OneDark
colorscheme onedark

" Vim Airline
let g:airline_powerline_fonts = 1

" NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>v :NERDTreeFind<CR>
" autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree")) | q | endif

" Vim Devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

"fzf 
nnoremap <leader><space> :Files<CR>
nnoremap <leader>h :History<CR>
