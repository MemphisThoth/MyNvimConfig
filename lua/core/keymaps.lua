-- leader key before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Key bindings for nvim-tree file browser
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file browser" })
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file browser" })


