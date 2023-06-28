-- Encoding
vim.o.encoding = "utf-8"

-- Numbering
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2

-- Searching/Replacing
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.inccommand = "nosplit"

-- Undo
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Swapping and Backups
vim.o.swapfile = false
vim.o.backup = false

-- Highlight current line
vim.o.cursorline = true

-- Display
vim.o.updatetime = 50
vim.o.guicursor = ""
vim.o.pumblend = 0
vim.o.winblend = 0
vim.o.pumheight = 10
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.colorcolumn = "81"
vim.o.cursorline = true
vim.o.termguicolors = true

-- Mouse/Keyboard
vim.o.mouse = "a"

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

-- Matchpairs
vim.opt.matchpairs:append({ "<:>" })

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Buffers
vim.o.hidden = true

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Default tabbing
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Netrw settings
vim.g.netrw_banner = false
vim.g.netrw_altfile = 1
