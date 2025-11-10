require("catppuccin").setup({
  flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
  integrations = {
    lualine = true,
    treesitter = true,
    mason = true,
    cmp = true,
    gitsigns = true,
    telescope = true,
    which_key = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})

vim.cmd.colorscheme("catppuccin")


