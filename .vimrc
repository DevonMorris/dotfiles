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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'

" Typing
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Multi-entry selection UI. FZF, and silver searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Style
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ajmwagar/vim-deus'
Plug 'scrooloose/nerdtree'

call plug#end()

"""""""""""" General Configuration """"""""""""""

" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set nocompatible              " be improved, required
set encoding=utf-8
set lazyredraw

set updatetime=300

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
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme deus
set background=dark
let g:deus_termcolors=256

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

" Polyglot disabled
let g:polyglot_disabled = ['csv']

" Mappings to move up and down lines visually
" It only makes a difference on long lines that wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
nnoremap k gk

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

" Trigger configuration for ultisnips.
let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/vim-snippets/UltiSnips','/home/devon/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Don't override background
highlight NonText ctermbg=NONE
highlight Pmenu guibg='#666666'
highlight clear LineNr
highlight clear Signcolumn
highlight clear VertSplit

" 80 column limit
highlight ColorColumn ctermbg=black
set colorcolumn=80

" Git Gutter mappings
nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gN :GitGutterPrevHunk<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
nnoremap <leader>gb :Gblame<CR>

" FZF
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" leader + b to search buffers
nnoremap <leader>b :Buffers<CR>
" leader + f to search lines
nnoremap <leader>f :BLines<CR>
" leader + e to edit files
" Ctrl+t, Ctrl+x, Ctrl+v to open in tab, split, vsplit
nnoremap <leader>o :Files<CR>
" leader + s (for UltiSnips) to insert a snippet
nnoremap <leader>s :Snippets<CR>
" leader + rg for ripgrep searching based on cwd
nnoremap <leader>rg :Rg<CR>
" leader + t to search tags in current workspace
nnoremap <leader>t :Tags<CR>

" View latex documents with zathura
let g:vimtex_view_method = 'zathura'

" Lightline config
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
set laststatus=2
set noshowmode

" CoC Mappings & Functions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> gn <Plug>(coc-diagnostic-prev)
nmap <silent> gp <Plug>(coc-diagnostic-next)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')c-diagnostic-next)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Nerdtree mappings
nnoremap <leader>ex :NERDTreeToggle <CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
