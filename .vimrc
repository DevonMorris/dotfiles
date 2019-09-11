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
Plug 'airblade/vim-gitgutter'

" Typing
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'triglav/vim-visual-increment'
Plug 'tpope/vim-fugitive'

" Multi-entry selection UI. FZF, and silver searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'

" MD preview
Plug 'shime/vim-livedown'

call plug#end()

"""""""""""" General Configuration """"""""""""""

" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set nocompatible              " be improved, required
set encoding=utf-8
set lazyredraw

set number relativenumber
set numberwidth=2
set incsearch

" Add mouse support for n00bs who use my computer
set mouse=a

" Highlight current line
set cursorline

" Only use 'hybrid' numbers in focused terminal
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set completeopt=menu
set completeopt+=noinsert

filetype plugin indent on    " required
filetype plugin on
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
colorscheme enigma
set background=dark

" This is for editing tags in xml files
set matchpairs+=<:>

let mapleader = '\\'
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

" Open splits the way I want
set splitright
set splitbelow

" Mappings to move up and down lines visually
" It only makes a difference on long lines that wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
nnoremap k gk

" Treat _ as word separator
set iskeyword-=_

" Make jumping between buffers easier
set hidden

" Stop playing around with registers and clipboards
" on some systems this is unnamed, on some unnamedplus
" just copy something and check :reg
set clipboard=unnamedplus

autocmd FileType make set noexpandtab softtabstop=0
autocmd FileType c setlocal ts=2 sw=2 expandtab
autocmd FileType cpp setlocal ts=2 sw=2 expandtab
autocmd FileType py setlocal ts=4 sw=4 expandtab

""""""""""""""""" Plugin Configuration """""""""""""
"" ALE
" Use LSP linters
let g:ale_linters = {'cpp': ['ccls','cpplint'], 'python':['pyls'], 'cmake': ['cmakelint']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'
let g:ale_c_parse_compile_commands=1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_echo_cursor = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1

" Use Ale to jump to definition, etc.
nnoremap gh :ALEHover<CR>
nnoremap gd  :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap ge :ALEDetail<CR>

" Show ale errors in airline status bar
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" Trigger configuration for ultisnips.
let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets/UltiSnips','/home/devon/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Don't override background
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE
highlight clear LineNr
highlight clear Signcolumn
highlight clear VertSplit
" But let pop upmenu override background so you can tell it's a popup
highlight Pmenu ctermbg=darkgray guibg=darkgray

" Git Gutter mappings
nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gN :GitGutterPrevHunk<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
nnoremap <leader>gb :Gblame<CR>

" FZF
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" leader + f to search files
" Ctrl+t, Ctrl+x, Ctrl+v to open in tab, split, vsplit
nnoremap <leader>f :Files<CR>
" leader + s (for UltiSnips) to insert a snippet
nnoremap <leader>s :Snippets<CR>
" leader + ag for ag searching based on cwd
nnoremap <leader>ag :Ag<CR>

" View latex documents with zathura
let g:vimtex_view_method = 'zathura'

" Nerdtree mappings
nnoremap <leader>ex :NERDTreeToggle <CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
