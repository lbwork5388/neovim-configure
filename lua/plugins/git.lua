-- Git integration (gitsigns)
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- 在左侧显示 git 标记
        numhl      = false, -- 高亮行号
        linehl     = false, -- 高亮整行
        word_diff  = false, -- 单词级别的 diff
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- 当前行显示 blame（可以开启）
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          
          -- Navigation: jump between hunks
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true, desc = "Next Hunk"})
          
          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true, desc = "Prev Hunk"})
          
          -- Git operations
          map('n', '<leader>hs', gs.stage_hunk, {desc = "Stage Hunk"})
          map('n', '<leader>hr', gs.reset_hunk, {desc = "Reset Hunk"})
          map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Stage Hunk"})
          map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Reset Hunk"})
          map('n', '<leader>hS', gs.stage_buffer, {desc = "Stage Buffer"})
          map('n', '<leader>hu', gs.undo_stage_hunk, {desc = "Undo Stage Hunk"})
          map('n', '<leader>hR', gs.reset_buffer, {desc = "Reset Buffer"})
          map('n', '<leader>hp', gs.preview_hunk, {desc = "Preview Hunk"})
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc = "Blame Line"})
          map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = "Toggle Blame"})
          map('n', '<leader>hd', gs.diffthis, {desc = "Diff This"})
          map('n', '<leader>hD', function() gs.diffthis('~') end, {desc = "Diff This ~"})
          map('n', '<leader>td', gs.toggle_deleted, {desc = "Toggle Deleted"})
          
          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {desc = "Select Hunk"})
        end
      })
    end,
  },
}

