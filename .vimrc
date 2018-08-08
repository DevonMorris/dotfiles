set nocompatible              " be improved, required
set laststatus=2
set encoding=utf-8
filetype off                  " required
" set relativenumber
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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'flazz/vim-colorschemes'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'

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
colorscheme monokai
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

" Mapping to edit ~/.vim/.ycm_extra_conf.py
nnoremap <leader>ycm :vsplit ~/.vim/.ycm_extra_conf.py<cr>

" Mappings to move between panes
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>

" Mapping for jumping
nnoremap <S-Tab> <C-O>

" Mappings for Git (vim-fugitive and git-gutter)
nnoremap <leader>gc :Gcommit <CR>
nnoremap <leader>gp :Gpush <CR>
nnoremap <leader>gb :Gbrowse <CR>
nmap <leader>ga <Plug>GitGutterStageHunk
nmap <leader>gd <Plug>GitGutterPreviewHunk
nmap <leader>gu <Plug>GitGutterUndoHunk
nmap <leader>gj <Plug>GitGutterNextHunk
nmap <leader>gk <Plug>GitGutterPrevHunk

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
nnoremap <leader>ex :Vex <CR>
let g:netrw_banner = 0
let g:netrw_winsize = 20

autocmd FileType make set noexpandtab softtabstop=0

augroup cpp
	autocmd!
  set tabstop=2
  set shiftwidth=2
augroup END

" Remap for latex compiling
nnoremap <leader>ll :w<CR>:!rubber --pdf --warn all %<CR>
nnoremap <leader>lv :!mupdf %:r.pdf &<CR><CR>

" This is for airline and powerline
" Note: If symbols don't appear install them with
" `sudo apt install fonts-powerline` Ubuntu
" or from https://github.com/powerline/fonts for macOS
" Note: there is a fix for iTerm2 mentioned in their README
let g:airline_powerline_fonts = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1

" Trigger configuration for ultisnips. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

au FileType c,cpp setlocal comments-=:// comments+=f://

" Don't override background
hi Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE

" Use YCM to jump like ctags
nnoremap <c-]> :YcmCompleter GoTo<CR>

" Use YCM to view documentation
nnoremap <leader>doc :YcmCompleter GetDoc<CR>
