vim.opt.number = true		-- Show line numbers
vim.opt.relativenumber = true	-- Relative line numbers
vim.opt.cursorline = true	-- Highlight current line
vim.opt.signcolumn = "yes"	-- Always show sign column
vim.opt.termguicolors = true	-- Enable true color support
vim.opt.scrolloff = 8		-- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8	-- Horizontal scroll padding
vim.opt.wrap = false		-- Disable line wrapping

vim.opt.tabstop = 4		-- Number of spaces per tab
vim.opt.shiftwidth = 4		-- Indent size
vim.opt.expandtab = true	-- Use spaces instead of tab
vim.opt.smartindent = true	-- Auto-indent new lines
vim.opt.autoindent = true	-- Copy indent from current line
vim.opt.backspace = "indent,eol,start" -- Make backspace behave intuitively

vim.opt.ignorecase = true	-- Case insensitive search
vim.opt.smartcase = true	-- unless uppercase is used
vim.opt.incsearch = true	-- Show matches while typing
vim.opt.hlsearch = true		-- Highlight all matches

vim.opt.swapfile = false	-- Disable swap files
vim.opt.backup = false		-- Disable backup files
vim.opt.undofile = true		-- Enable persistent undo
vim.opt.autoread = true		-- Auto-reload changed files

vim.opt.updatetime = 300	-- Faster cursorhold events
vim.opt.timeoutlen = 500	-- Shorter key sequence timeout
vim.opt.mouse = "a"		-- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
