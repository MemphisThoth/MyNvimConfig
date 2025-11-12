require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "jq" },
        sh = { "shfmt" },
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
    },
})
