" Vim .vimrc
" author: Devon Morris
" contact: devonmorris1992@gmail.com
" date: Mon 15 Jun 2020 11:18:03 PM EDT

""""""""""""""" Start Server """""""""""""""""""
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
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'

" Language specific
Plug 'lervag/vimtex'

" Typing
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

"" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Style
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ajmwagar/vim-deus'

"" Misc
Plug 'vim-utils/vim-man'

call plug#end()

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

" Highlight current line
set cursorline

" Remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Only use 'hybrid' numbers in focused window
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Use popup menu for completion and don't insert by default
set completeopt=menu
set completeopt+=noinsert

filetype plugin indent on    " required
syntax on
set tabstop=2
set shiftwidth=2
set expandtab

" All of this has to be set bc of tmux and deus theme
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme deus
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
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>

" Open splits the way I want
set splitright
set splitbelow

" Polyglot disabled
let g:polyglot_disabled = ['csv', 'latex']

" Cpp syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Make jumping between buffers easier
set hidden

" Stop playing around with registers and clipboards
" on some systems this is unnamed, on some unnamedplus
" just copy something and check :reg
set clipboard=unnamedplus

" Don't override background
highlight NonText ctermbg=NONE
highlight Pmenu guibg='#666666'
highlight clear LineNr
highlight clear SignColumn
highlight clear VertSplit

" 80 column limit
highlight ColorColumn ctermbg=black
set colorcolumn=80

""""""""""""""""" Plugin Configuration """""""""""""
" Fugitive mappings
nnoremap <leader>gb :Gblame<CR>

" FZF mapings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :BLines<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>t :Tags<CR>

" View latex documents with zathura
let g:vimtex_view_method = 'zathura'

" View md documents in browser
nmap <leader>md <Plug>MarkdownPreview

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
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gN <Plug>(coc-diagnostic-prev)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')c-diagnostic-next)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Netrw mappings
nnoremap <leader>ex :Vex <CR>
let g:netrw_banner=0
let g:netrw_winsize=25
