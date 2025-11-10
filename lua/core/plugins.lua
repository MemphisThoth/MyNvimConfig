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
},
{
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "omnisharp" },
    })
  end,
},
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
},
{
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, opts)
          opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
        map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
        map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
        map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
        map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
        map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
        map("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>")
      end,
    })
  end,
},
{
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
},
{
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        css = true,
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
        mode = "background", -- or "foreground" for colored text
      },
    })
  end,
}


})

