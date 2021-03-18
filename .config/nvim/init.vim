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

lua vim.cmd'source ~/.vimrc'

" Utility functions to use from cmd
lua require'functions'

if empty(glob('~/.local/share/nvim/site/pack/packer'))
  silent !git clone https://github.com/wbthomason/packer.nvim
    \ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
endif

" Autocmds
lua require'autocmd'

" Mappings
lua require'mappings'

" Plugins
lua require'plugins'

" Colorscheme
lua require'config.colorscheme'

" Settings
lua require'settings'

" Kommentary
lua require'config.kommentary'

" Telescope
lua require'config.telescope'

" use omni completion provided by lsp
lua require'config.completion'

" Lsp
lua require'config.lsp'

" Tree Sitter
lua require'config.treesitter'

" Vimtex
lua require'config.vimtex'

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
