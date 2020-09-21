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

nnoremap <silent>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><c-k> <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent><c-n> <cmd>NextDiagnosticCycle<CR>
nnoremap <silent><c-p> <cmd>PrevDiagnosticCycle<CR>

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
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :BLines<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>t :Tags<CR>
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
      \             [ 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }
