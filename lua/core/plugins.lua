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
},
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "python", "javascript", "typescript", "bash", "json", "yaml", "markdown"
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    })
  end,
},
{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".DS_Store", "thumbs.db" },
      },
      git = {
        enable = true,
        ignore = false,
      },
    })
  end,
},
{
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5", -- or latest stable
  dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>tf", function() require("telescope.builtin").find_files() end, desc = "Telescope: Find files" },
        { "<leader>tg", function() require("telescope.builtin").live_grep() end, desc = "Telescope: Live grep" },
        { "<leader>tb", function() require("telescope.builtin").buffers() end, desc = "Telescope: Buffers" },
        { "<leader>th", function() require("telescope.builtin").help_tags() end, desc = "Telescope: Help tags" },
    },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
          preview_width = 0.6,
        },
        sorting_strategy = "ascending",
        winblend = 10,
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
  end,
}



  -- Add more plugins here
})

