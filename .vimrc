" Vim .vimrc
" author: Devon Morris 
" contact: devonmorris1992@gmail.com
" date: Mar 28 2019

"""""""""""""" Start Server """""""""""""""""""
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

"""""""""""""" Plugins """""""""""""""""""
" Install vim-plug automatically if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" Syntax/Linting
Plug 'w0rp/ale'
Plug 'lervag/vimtex'

" Typing
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Multi-entry selection UI. FZF, and silver searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'

" Note taking/Journaling 
Plug 'vimwiki/vimwiki'

call plug#end()

"""""""""""" General Configuration """"""""""""""

" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set nocompatible              " be improved, required
set encoding=utf-8
set lazyredraw

set number relativenumber
set incsearch

" Hide buffers that have edits
set hidden

" Add mouse support for noobs who use my computer
set mouse=a

" Only use 'hybrid' numbers in focused terminal
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set completeopt=menu

filetype plugin indent on    " required
filetype plugin on
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
colorscheme molokai
set background=dark

" This is for editing tags in xml files
set matchpairs+=<:>

let mapleader = "\\"
nmap <space> <leader>
vmap <space> <leader>
set backspace=indent,eol,start

" Escape Mappings for insert, visual and command modes
inoremap jk <esc>
vnoremap jk <esc>
cnoremap jk <C-c>

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

" Open splits the way I want
set splitright
set splitbelow

" Mappings to move up and down lines visually
" It only makes a difference on long lines that wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
nnoremap k gk

" Mappings for tree list netrw
nnoremap <leader>ex :NERDTreeToggle <CR>

" Treat _ as word separator
set iskeyword-=_

" Stop playing around with clipboards
set clipboard=unnamed

autocmd FileType make set noexpandtab softtabstop=0
autocmd FileType c setlocal ts=2 sw=2 expandtab
autocmd FileType cpp setlocal ts=2 sw=2 expandtab
autocmd FileType py setlocal ts=4 sw=4 expandtab




""""""""""""""""" Plugin Configuration """""""""""""
"" ALE
" Use LSP linters
" To use clang, make sure to install clang and update alternatives 
" https://askubuntu.com/questions/970640/trying-to-install-atom-unable-to-start-clangd-language-server
" Is a good resource, but this needs to be done for each linter
let g:ale_linters = {'cpp': ['clang', 'clangd', 'clangcheck', 'clangtidy', 'clang-format'], 'python':['pyls'], 'cmake': ['cmakelint']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'
let g:ale_c_parse_compile_commands=1
let g:ale_cpp_clangtidy_checks = ['modernize', 'google', 'clang-analyzer', 'performance', 'readability', 'bugprone']
let g:ale_lint_on_text_changed = 'never'

" Use Ale to jump to definition, etc.
nnoremap <leader>i :ALEHover<CR>
nnoremap <leader>d  :ALEGoToDefinition<CR>
nnoremap <leader>r :ALEFindReferences<CR>

" Show ale errors in airline status bar
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" This is for airline and powerline
" Note: If symbols don't appear install them with
" `sudo apt install fonts-powerline` Ubuntu
" This font is also required for the ale_msgs
let g:airline_theme='molokai'

" Trigger configuration for ultisnips. 
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips","/home/devon/.vim/UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Don't override background
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE
highlight clear LineNr
highlight clear Signcolumn
" But let pop upmenu override background so you can tell it's a popup
highlight Pmenu ctermbg=darkgray guibg=darkgray

" FZF
" leader + f to search files
" Ctrl+t, Ctrl+x, Ctrl+v to open in tab, split, vsplit
nnoremap <leader>f :Files<CR>
" leader + s (for UltiSnips) to insert a snippet
nnoremap <leader>s :Snippets<CR>
" leader + gr for ag searching based on cwd (think grep)
nnoremap <leader>ag :Ag<CR>


" Use nerdtree instead of netrw
cnoremap Ex NERDTreeToggle

" Make vimtex use xelatex
let g:vimtex_view_method = 'zathura'

" Nerdtree mappings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
cnoremap Ex NERDTreeToggle
