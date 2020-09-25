" Neovim init.vim
" author: Devon Morris
" contact: devonmorris1992@gmail.com
" date: Mon 21 Sep 2020 10:39:15 AM EDT
" Note: everything in this file should be neovim or plugin specific
" for everything regarding plain vim config check out ~/.vimrc
"
""""""""""""""" Start Server """""""""""""""""""
" This is important for the vimtex plugin
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

source ~/.vimrc

" Polyglot disabled
let g:polyglot_disabled = ['csv', 'latex']

"""""""""""""" Plugins """""""""""""""""""
" Install vim-plug automatically if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" vim-plug plugin manager
call plug#begin()

" Lsp
Plug 'neovim/nvim-lspconfig'

" Autocomplete
Plug 'nvim-lua/completion-nvim'

" Diagnostics
Plug 'nvim-lua/diagnostic-nvim'

" Syntax/Linting
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

"" Vim Wiki
Plug 'vimwiki/vimwiki'

call plug#end()

" Colorscheme
colorscheme deus
set background=dark

" Highlight current line
set cursorline

" Highlight popup menu
highlight Pmenu guibg='#666666'

" Neovim specific display
set guicursor=
set inccommand=nosplit
set pumblend=20
set winblend=20

" Lsp
lua require'lsp_config'

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Diagnostics
let g:diagnostic_enable_virtual_text = 0

" Cpp syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Fugitive mappings
nnoremap <leader>gb :Gblame<CR>

" FZF mapings
nnoremap <leader>b <Cmd>Buffers<CR>
nnoremap <leader>f <Cmd>:BLines<CR>
nnoremap <leader>o <Cmd>:Files<CR>
nnoremap <leader>rg <Cmd>:Rg<CR>
nnoremap <leader>t <Cmd>:Tags<CR>
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6} }
let $FZF_DEFAULT_OPTS='--reverse'

" View latex documents with zathura
let g:vimtex_view_method = 'zathura'

" Set tex flavor
let g:tex_flavor = 'latex'

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'currentfunction', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ }

" Vimwiki config
let g:vimwiki_list = [{'path': '~/.notes/', 'syntax' : 'markdown', 'ext': '.md'}]
nmap <leader>wt <Plug>VimwikiMakeDiaryNote
nmap <leader>wy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <leader>wm <Plug>VimwikiMakeTomorrowDiaryNote
nmap <leader>wu <Plug>VimwikiDiaryGenerateLinks

" Quick Source
noremap <leader>sv <Cmd>source $MYVIMRC<CR>
