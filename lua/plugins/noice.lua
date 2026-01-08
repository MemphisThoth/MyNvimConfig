return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline_popup",
          format = {
            cmdline = { icon = " " },
            search_down = { icon = " " },
            search_up = { icon = " " },
          },
        },

        popupmenu = {
          backend = "nui",
        },

        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },

        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          lsp_doc_border = true,
        },

        views = {
          cmdline_popup = {
            border = {
              style = "rounded",
              padding = { 1, 2 },
            },
            position = {
              row = "30%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
            win_options = {
              winblend = 10,
              winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
            },
          },

          popupmenu = {
            relative = "editor",
            position = {
              row = "40%",
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 1, 2 },
            },
            win_options = {
              winblend = 10,
            },
          },
        },
      })
    end,
  },
}

