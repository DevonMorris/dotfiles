" Neovim init.vim
" author: Devon Morris
" contact: devonmorris1992@gmail.com
" date: Wed Mar 17 21:40:09 EDT 2021
" Note: everything in this file should be neovim or plugin specific
" for everything regarding plain vim config check out ~/.vimrc
"
lua vim.cmd'source ~/.vimrc'

" Utility functions to use from cmd
lua require'functions'

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

" Package configuration and package specific mappings
lua require'config'

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
