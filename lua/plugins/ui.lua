-- UI enhancements
return {
  -- Noice: Better command-line and notifications
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- Notification system
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- Override LSP UI
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- Command-line config
        cmdline = {
          enabled = true,
          view = "cmdline_popup", -- Popup command-line
          format = {
            cmdline = { pattern = "^:", icon = "  ", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = " $", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = " " },
          },
        },
        messages = {
          enabled = true,
          view = "notify",
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
        popupmenu = {
          enabled = true,
          backend = "nui", -- Use nui for popup menu
        },
        -- Presets
        presets = {
          bottom_search = true,         -- Bottom search bar
          command_palette = true,       -- Command palette style
          long_message_to_split = true, -- Long messages to split
          inc_rename = false,           -- Incremental rename
          lsp_doc_border = true,        -- LSP doc border
        },
      })
    end,
  },

  -- Notification system
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = true
      })
      
      -- Set as default notification
      vim.notify = require("notify")
    end,
  },

  -- Indent guides (make code structure clearer)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        },
        exclude = {
          filetypes = {
            "help",
            "lazy",
            "mason",
            "notify",
            "NvimTree",
          },
        },
      })
    end,
  },
}

