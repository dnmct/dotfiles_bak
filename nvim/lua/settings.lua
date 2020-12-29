local vim = vim
local U = require 'utils'

vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showmode = false
vim.o.clipboard = 'unnamedplus'

vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.signcolumn = 'yes'

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.g.netrw_dirhistmax = 0

vim.cmd('colo gruvbox8')

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- Map <leader> to space
U.map("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "

