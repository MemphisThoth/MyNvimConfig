-- lua/core/options.lua

local opt = vim.opt
local g = vim.g

-- Core editor behavior
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Files & Backups
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Perfomance 
opt.updatetime = 250
opt.timeoutlen = 400

-- Clipboard
opt.clipboard = "unnamedplus"

-- Misc
opt.hidden = true
opt.completeopt = { "menu", "menuone", "noselect" }
