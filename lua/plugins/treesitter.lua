return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "bash",
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "jsonc",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

