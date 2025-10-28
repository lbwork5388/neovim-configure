-- Codeium: Free AI code completion
return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",  -- Load on buffer enter
    config = function()
      -- Disable default Tab binding (avoid conflict with nvim-cmp)
      vim.g.codeium_disable_bindings = 1
      
      -- Custom keymaps
      -- Tab: Accept Codeium suggestion (smart fallback to normal Tab)
      vim.keymap.set('i', '<Tab>', function()
        if vim.fn['codeium#Accept']() ~= '' then
          return vim.fn['codeium#Accept']()
        else
          return '<Tab>'
        end
      end, { expr = true, silent = true, desc = "Accept Codeium or Tab" })
      
      vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true, desc = "Next Codeium suggestion" })
      vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true, desc = "Previous Codeium suggestion" })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true, desc = "Clear Codeium suggestion" })
      
      -- Manual trigger
      vim.keymap.set('i', '<C-Space>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true, desc = "Trigger Codeium" })
      
      -- Status commands
      vim.keymap.set('n', '<leader>cs', ':Codeium Status<CR>', { silent = true, desc = "Codeium Status" })
      vim.keymap.set('n', '<leader>ce', ':Codeium Enable<CR>', { silent = true, desc = "Enable Codeium" })
      vim.keymap.set('n', '<leader>cd', ':Codeium Disable<CR>', { silent = true, desc = "Disable Codeium" })
    end,
  },
}

