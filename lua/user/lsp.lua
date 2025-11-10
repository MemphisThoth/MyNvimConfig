local lspconfig = require("lspconfig")

-- Optional: Add capabilities for completion plugins
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- if using nvim-cmp

-- Format-on-save logic
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
end

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
    on_attach = on_attach,
    settings = config,
  })
end


