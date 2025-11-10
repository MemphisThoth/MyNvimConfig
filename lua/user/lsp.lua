local lspconfig = require("lspconfig")

-- Optional: Add capabilities for completion plugins
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- if using nvim-cmp


-- Define servers and their settings
local servers = {
  lua_ls = {},
  pyright = {},
  tsserver = {},
}

-- Loop through and setup each server
for server, config in pairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    settings = config,
  })
end


