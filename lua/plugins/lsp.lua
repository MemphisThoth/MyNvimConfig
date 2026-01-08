return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "jsonls",
          "yamlls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
      --------------------------------------------------------------------
      -- Helper: default capabilities (for nvim-cmp)
      --------------------------------------------------------------------
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      --------------------------------------------------------------------
      -- Lua LS (example)
      --------------------------------------------------------------------
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      --------------------------------------------------------------------
      -- Bash
      --------------------------------------------------------------------
      vim.lsp.config("bashls", {
        capabilities = capabilities,
      })

      --------------------------------------------------------------------
      -- JSON
      --------------------------------------------------------------------
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })

      --------------------------------------------------------------------
      -- YAML
      --------------------------------------------------------------------
      vim.lsp.config("yamlls", {
        capabilities = capabilities,
      })

      --------------------------------------------------------------------
      -- Enable all configured servers
      --------------------------------------------------------------------
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("yamlls")
    end,
  },
}
