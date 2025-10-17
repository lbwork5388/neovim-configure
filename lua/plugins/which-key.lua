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
          mappings = true,
        },
        win = {
          border = "rounded",
          padding = { 1, 2 },
        },
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
      })
    end,
  },
}

