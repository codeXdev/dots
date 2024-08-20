require("logicvolt")


-- ~/.config/nvim/lua/options.lua
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.linespace = 0
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.ttyfast = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.clipboard = "unnamed"
vim.opt.linespace = 10
vim.opt.guifont = "RecMonoCasual Nerd Font Mono:h11" 
vim.opt.linespace = 10
vim.conceallevel=0
vim.tex_conceal = "dmgs"
-- =>
-- ===

-- Set file format to Unix-style
vim.cmd('set ff=unix')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Custom status line (similar to 'set ruler')
vim.o.statusline = '%f %m %r'

-- Enable search result highlighting
vim.cmd('set hlsearch')

-- Incremental search highlighting
vim.cmd('set incsearch')

-- Case-insensitive search
vim.cmd('set ignorecase')

-- Smart case sensitivity in search
vim.cmd('set smartcase')



