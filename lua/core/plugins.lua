-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-lualine/lualine.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
  "neovim/nvim-lspconfig", -- Core LSP support
},
{
  "williamboman/mason.nvim",       -- LSP/DAP installer
  "williamboman/mason-lspconfig.nvim", -- Bridge to lspconfig
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "tsserver" }, -- Add your servers here
    })
  end,
}

  -- Add more plugins here
})

