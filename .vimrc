set nocompatible              " be improved, required
set laststatus=2
set encoding=utf-8
filetype off                  " required
set relativenumber
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'flazz/vim-colorschemes'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
set completeopt-=preview

set lazyredraw

filetype plugin indent on    " required
filetype plugin on
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256
colorscheme gruvbox
set background=dark

let mapleader = "\\"
nmap <space> <leader>
vmap <space> <leader>
set backspace=indent,eol,start

" Escape Mappings for insert and visual modes
inoremap jk <esc>
vnoremap jk <esc>

" Mappings to edit .vimrc and source/save .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Mappings to move between panes
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" Mapping for jumping
nnoremap <S-Tab> <C-O>

" Mappings to compile/run files
nnoremap <leader>go :!python %<cr>
nnoremap <leader>gcc :!gcc % -o %:r<cr>
nnoremap <leader>gpp :!g++ -std=c++0x % -o %:r<cr>
nnoremap <leader>cpp :!clang++ -std=c++11 -stdlib=libc++ % -o %:r<cr>
nnoremap <leader>rpp :!./%:r <cr>

" Mapping to autosave new file

" Mappings to go to end of line and beginning of line
nnoremap L $
vnoremap L $
nnoremap H 0
vnoremap H 0

" Mappings to move up and down faster
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k

" Mappings for tree list netrw
let g:netrw_banner = 0
let g:netrw_winsize = 20

"abbreviations for cpp
function CppAbbrevs()
	iabbrev #i #include 
	iabbrev io iostream
	iabbrev str string
	iabbrev std; using<space>namespace<space>std;
endfunction

autocmd FileType make set noexpandtab softtabstop=0

augroup cpp
	autocmd!
	autocmd BufNewFile,BufRead *.cpp call CppAbbrevs()
    set tabstop=2
    set shiftwidth=2
augroup END
" Remap for autocomplete
inoremap jj <C-X><C-P>

" Remap for latex compiling
nnoremap <leader>ll :w<CR>:!rubber --pdf --warn all %<CR>
nnoremap <leader>lv :!mupdf %:r.pdf &<CR><CR>

" Omni Complete
set omnifunc=syntaxcomplete#Complete

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
