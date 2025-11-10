local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  lua_ls = {},
  pyright = {},
  vtsls = {
    settings = {
      typescript = {
        inlayHints = {
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
      javascript = {
        inlayHints = {
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
    },
  },
  eslint = {},
  biome = {},
  omnisharp = {
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/OmniSharp" },
    settings = {
      omnisharp = {
        enableEditorConfigSupport = true,
        enableMsBuildLoadProjectsOnDemand = false,
        enableRoslynAnalyzers = true,
        organizeImportsOnFormat = true,
        enableImportCompletion = true,
        sdkIncludePrereleases = true,
        analyzeOpenDocumentsOnly = false,
      },
    },
  },
}

for server, config in pairs(servers) do
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  if config.cmd then
    opts.cmd = config.cmd
  end

  if config.settings then
    opts.settings = config.settings
  end

  lspconfig[server].setup(opts)
end

