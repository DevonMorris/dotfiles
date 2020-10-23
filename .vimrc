" Vim .vimrc
" author: Devon Morris
" contact: devonmorris1992@gmail.com
" date: Mon 21 Sep 2020 10:39:28 AM EDT
" Note: everything in this file should be non-plugin vim specific
" for everything regarding plugins or neovim check out ~/.config/nvim/init.vim

"""""""""""" General Configuration """"""""""""""
" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set encoding=utf-8

set number relativenumber
set numberwidth=2

" Better Searching
set incsearch
set ignorecase
set smartcase
set nohlsearch

" Undodir
set undodir=~/.vim/undodir
set undofile

" No swap file or backups
set noswapfile
set nobackup

" Fast update
set updatetime=50

" Add mouse support for n00bs who use my computer
set mouse=a

" Remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Only use 'hybrid' numbers in focused window
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Open vimhelp in vertical split
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Use popup menu for completion and don't insert by default
set completeopt=menuone,noinsert,noselect

filetype plugin indent on    " required
syntax on

" This is for editing tags in xml files
set matchpairs+=<:>

let mapleader = '\\'
nmap <space> <leader>
vmap <space> <leader>
set backspace=indent,eol,start

" Mappings to move between panes
nnoremap <silent> <leader>l :wincmd l<cr>
nnoremap <silent> <leader>h :wincmd h<cr>
nnoremap <silent> <leader>j :wincmd j<cr>
nnoremap <silent> <leader>k :wincmd k<cr>

" Open splits the way I want
set splitright
set splitbelow

" Make jumping between buffers easier
set hidden

" Stop playing around with registers and clipboards
" on some systems this is unnamed, on some unnamedplus
" just copy something and check :reg
set clipboard=unnamedplus

" Don't override background
highlight NonText ctermbg=NONE
highlight clear LineNr
highlight clear SignColumn
highlight clear VertSplit

" 80 column limit
highlight ColorColumn ctermbg=black
set colorcolumn=80

" Set full file path
set statusline+=%F
set laststatus=2
set noshowmode

" Netrw mappings
nnoremap <leader>ex :Vex <CR>
let g:netrw_banner=0
let g:netrw_winsize=25

" Colorscheme for plain old vim
colorscheme slate
set termguicolors

set expandtab
