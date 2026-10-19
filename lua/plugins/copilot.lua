-- AI suggestions use separate keys; nvim-cmp owns Tab and Ctrl-Space.
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    keys = {
      { "<leader>cs", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
      { "<leader>ce", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
      { "<leader>cd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
    },
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        keymap = {
          accept = "<C-g>",
          accept_word = false,
          accept_line = "<C-l>",
          next = false,
          prev = false,
          dismiss = "<C-]>",
        },
      },
    },
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)
      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
      require("copilot").setup(opts)
    end,
  },
}
