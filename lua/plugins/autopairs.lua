-- Auto-pairs: Automatic bracket pairing
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      
      autopairs.setup({
        check_ts = true, -- Use treesitter
        ts_config = {
          lua = { "string" }, -- Don't pair in lua strings
          javascript = { "template_string" },
          java = false, -- Don't check java
        },
        disable_filetype = { "TelescopePrompt", "vim" },
        
        -- Fast wrap
        fast_wrap = {
          map = '<M-e>', -- Alt+e for fast wrap
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey='Comment'
        },
      })
      
      -- Integrate with nvim-cmp (work with auto-completion)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
}

