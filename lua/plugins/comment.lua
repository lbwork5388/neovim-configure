-- Comment plugin: Quick comment/uncomment
return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Toggle Comment" },
      { "gc", mode = { "n", "v" }, desc = "Comment" },
      { "gbc", mode = "n", desc = "Toggle Block Comment" },
      { "gb", mode = { "n", "v" }, desc = "Block Comment" },
    },
    config = function()
      require("Comment").setup({
        -- Add space between comment and code
        padding = true,
        -- Keep cursor position after commenting
        sticky = true,
        -- Ignore empty lines
        ignore = "^$",
        -- Keymaps
        toggler = {
          line = "gcc",  -- Line comment
          block = "gbc", -- Block comment
        },
        opleader = {
          line = "gc",   -- Line comment operator
          block = "gb",  -- Block comment operator
        },
        extra = {
          above = "gcO", -- Add comment above
          below = "gco", -- Add comment below
          eol = "gcA",   -- Add comment at end of line
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end,
  },
}

