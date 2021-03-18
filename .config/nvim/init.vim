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

" Settings
lua require'settings'

" Plugins
lua require'plugins'

" Package configuration and package specific mappings
lua require'config'
