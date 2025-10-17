-- Treesitter: Syntax highlighting (disabled)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = false, -- Disabled by default
    build = ":TSUpdate",
    lazy = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Auto-install language parsers
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "c",
          "cpp",
          "go",
          "rust",
        },
        
        -- Sync install (blocks startup)
        sync_install = false,
        
        -- Auto-install missing parsers
        auto_install = true,
        
        -- Ignore install list
        ignore_install = {},
        
        -- Enable highlighting
        highlight = {
          enable = true,
          -- Disable for large files (>100KB)
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
            return false
          end,
          -- Additional vim regex highlighting (usually not needed)
          additional_vim_regex_highlighting = false,
        },
        
        -- Incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
          },
        },
        
        -- Enable indentation
        indent = {
          enable = true,
          -- Disable for specific languages if needed
          disable = {},
        },
        
        -- Text objects
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}
