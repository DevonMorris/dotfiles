" Neovim init.vim
" author: Devon Morris
" contact: devonmorris1992@gmail.com
" date: Fri 25 Sep 2020 02:55:32 PM EDT
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

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter'

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

"" Style
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ajmwagar/vim-deus'

"" Suda
Plug 'lambdalisue/suda.vim'

"" Vim Wiki
Plug 'vimwiki/vimwiki'

"" Docker
Plug 'kkvh/vim-docker-tools'

"" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

call plug#end()


" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

" Tree Sitter
lua require'treesitter_config'

" Telescope Config
lua require'telescope_config'

" Telescope
nnoremap <Leader>o <Cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap <Leader>d <Cmd>lua require'telescope_config'.find_dots{}<CR>

" use omni completion provided by lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_ignore_case = 1

" Diagnostics
let g:diagnostic_enable_virtual_text = 0

" Cpp syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Fugitive mappings
nnoremap <leader>gb :Gblame<CR>

" View latex documents with zathura
let g:vimtex_view_method = 'zathura'

" Set tex flavor
let g:tex_flavor = 'latex'

let g:lightline = {
      \ 'colorscheme': 'deus',
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

" Docker tools
nnoremap <leader>w <Cmd>DockerToolsToggle<CR>

" Quick highlight for text on yank
au TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}
