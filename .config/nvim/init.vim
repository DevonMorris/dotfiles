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

" LSP Status
Plug 'nvim-lua/lsp-status.nvim'

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

" Fuzzy Finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Style
Plug 'itchyny/lightline.vim'
Plug 'ajmwagar/vim-deus'
Plug 'sainnhe/gruvbox-material'

" Suda
Plug 'lambdalisue/suda.vim'

" Docker
Plug 'kkvh/vim-docker-tools'

" Clojure
Plug 'Olical/conjure', {'tag': 'v4.15.0', 'for': 'clojure'}
Plug 'guns/vim-sexp', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure', 'scheme'] }

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

" Telescope
lua require'telescope_config'
nnoremap <Leader>o <Cmd>lua require'telescope.builtin'.find_files{find_command = {'fd', '--type', 'f'}, follow = true}<CR>
nnoremap <Leader>p <Cmd>lua require'telescope.builtin'.find_files{find_command = {'fd', '--type', 'f', '--no-ignore'}, follow = true}<CR>
nnoremap <Leader>d <Cmd>lua require'telescope_config'.find_dots{}<CR>
nnoremap <leader>gr <Cmd>lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For >") }<CR>
nnoremap <leader>f <Cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <leader>s <Cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <leader>r <Cmd>lua require'telescope.builtin'.registers{}<CR>
nnoremap <leader>b <Cmd>lua require'telescope.builtin'.buffers{shorten_path = true}<CR>
nnoremap <leader>ts <Cmd>lua require'telescope.builtin'.treesitter{}<CR>
nnoremap <leader>h <Cmd>lua require'telescope.builtin'.help_tags{}<CR>
nnoremap <leader>a <Cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>
nnoremap <leader>x <Cmd>lua require'telescope.builtin'.builtin{}<CR>

" Lsp
lua require'lsp_config'
nnoremap H <Cmd>lua require'lspconfig'.clangd.switch_source_header(0)<CR>
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Tree Sitter
lua require'treesitter_config'

" use omni completion provided by lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_ignore_case = 1
let g:completion_enable_auto_hover = 1

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
      \             [ 'gitbranch', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Cpp Man
function! s:CppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! CppMan :call s:CppMan()
au FileType cpp nnoremap <leader>k :CppMan<CR>

" Quick Source init.vim
noremap <leader>sv <Cmd>source $MYVIMRC<CR>

" Docker tools
nnoremap <leader>w <Cmd>DockerToolsToggle<CR>

" Jumps
nnoremap <C-G> <Cmd>ta<CR>
nnoremap <C-B> <C-^>

" Quick highlight for text on yank
au TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}

" Copy the clipboard for neovim on exit
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) .
            \ ' | xclip -selection clipboard')

" I can't fix my brain on this one so putting in a remap
tnoremap <Esc> <C-\><C-n>

" Quickfix
nnoremap <C-N> <Cmd>cn<CR>
nnoremap <C-P> <Cmd>cp<CR>
nnoremap <C-C> <Cmd>ccl<CR>

" Loclist
nnoremap <C-J> <Cmd>lnext<CR>
nnoremap <C-K> <Cmd>lprev<CR>

" LSP Loclist
augroup lsp
  autocmd!
  autocmd! BufEnter,BufWritePost,InsertLeave * :lua vim.lsp.diagnostic.set_loclist{open_loclist=false}
augroup END
