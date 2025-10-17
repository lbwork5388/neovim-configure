-- Flash.nvim: Lightning fast navigation
-- Press 's' + two letters to jump anywhere on screen instantly!
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      -- Default options
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        multi_window = true,
        forward = true,
        wrap = true,
      },
      label = {
        uppercase = false,
        style = "overlay", -- overlay, inline, eol
      },
      modes = {
        search = {
          enabled = false, -- Don't hijack regular search
        },
        char = {
          enabled = false, -- Don't hijack f, t, F, T
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}

