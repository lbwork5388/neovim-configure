-- Which-Key: Show available keybindings
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300 -- Show hints after 300ms
    end,
    config = function()
      local wk = require("which-key")
      
      wk.setup({
        preset = "modern",
        delay = 300,
        icons = {
          mappings = false, -- Disable all icons for clean look
          separator = "→", -- Use arrow separator
        },
        win = {
          border = "rounded",
          padding = { 2, 2 },
          title = true,
          title_pos = "center",
        },
        layout = {
          spacing = 3, -- Spacing between columns
        },
        show_help = false, -- Hide help message at bottom
        show_keys = true,
      })
      
      -- Register key group descriptions using new API
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Hunk" },
        { "<leader>t", group = "Toggle" },
        { "<leader>l", group = "Lazy" },
        { "<leader>e", group = "Explorer" },
        { "<leader>r", group = "Rename" },
        { "<leader>c", group = "Code/Codeium" },
        { "<leader>d", group = "Diagnostic" },
        { "<leader>x", group = "Trouble" },
      })
    end,
  },
}

