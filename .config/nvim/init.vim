" Neovim init.vim
" author: Devon Morris
" contact: devonmorris1992@gmail.com
" date: Tue Nov 10 21:09:35 EST 2020
" Note: everything in this file should be neovim or plugin specific
" for everything regarding plain vim config check out ~/.vimrc
"
""""""""""""""" Start Server """""""""""""""""""
" This is important for the vimtex plugin
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

source ~/.vimrc

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

" Async
Plug 'tpope/vim-dispatch'

" Language specific
Plug 'lervag/vimtex'

" Typing
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Style
Plug 'itchyny/lightline.vim'
Plug 'ajmwagar/vim-deus'
Plug 'sainnhe/gruvbox-material'

" Suda
Plug 'lambdalisue/suda.vim'

" Vim Wiki
Plug 'vimwiki/vimwiki'

" Docker
Plug 'kkvh/vim-docker-tools'

call plug#end()


" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Colorscheme
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set background=dark

" Highlight current line
set cursorline

" Neovim specific display
set guicursor=
set inccommand=nosplit
set pumblend=0
set winblend=0

" Lsp
lua require'lsp_config'

" Tree Sitter
lua require'treesitter_config'

" FZF configuration
command Dotfiles call fzf#run(fzf#wrap(({'source': 'find $HOME -path "$HOME/.*" 2> /dev/null'})))
command Directories call fzf#run(fzf#wrap(({'source': 'find .* -type d 2> /dev/null'})))
nnoremap <leader>b <Cmd>Buffers<CR>
nnoremap <leader>o <Cmd>Files<CR>
nnoremap <leader>rg <Cmd>Rg<CR>
nnoremap <leader>d <Cmd>Dotfiles<CR>
nnoremap <leader>m <Cmd>Helptags<CR>
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7} }

" use omni completion provided by lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_ignore_case = 1

" Diagnostics
let g:diagnostic_enable_virtual_text = 0

" Fugitive mappings
nnoremap <leader>gb :Gblame<CR>

" View latex documents with zathura
let g:vimtex_view_method = 'zathura'

" Set tex flavor
let g:tex_flavor = 'latex'

let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
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

" Quick Source init.vim
noremap <leader>sv <Cmd>source $MYVIMRC<CR>

" Docker tools
nnoremap <leader>w <Cmd>DockerToolsToggle<CR>

" Quick highlight for text on yank
au TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}

" Copy the clipboard for neovim on exit
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) .
            \ ' | xclip -selection clipboard')

" Quickfix
nnoremap <C-N> <Cmd>cn<CR>
nnoremap <C-P> <Cmd>cp<CR>
nnoremap <C-C> <Cmd>ccl<CR>
