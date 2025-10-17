-- Neovim basic options

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Treesitter context commentstring
vim.g.skip_ts_context_commentstring_module = true

-- Editor settings
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.mouse = "a"             -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Indentation
vim.opt.tabstop = 2             -- Tab width
vim.opt.shiftwidth = 2          -- Indent width
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.smartindent = true      -- Smart indentation

-- Search
vim.opt.ignorecase = true       -- Ignore case in search
vim.opt.smartcase = true        -- Case-sensitive if uppercase present

-- UI
vim.opt.termguicolors = false   -- Disable true colors (fixes which-key visibility)
vim.opt.signcolumn = "yes"      -- Always show sign column
vim.opt.cursorline = true       -- Highlight current line
vim.opt.wrap = false            -- No line wrapping
vim.opt.backup = false          -- No backup files
vim.opt.swapfile = false        -- No swap files
vim.opt.undofile = true         -- Enable persistent undo

-- Window splits
vim.opt.splitright = true       -- Vertical split to right
vim.opt.splitbelow = true       -- Horizontal split to bottom

-- Other
vim.opt.updatetime = 250        -- Update time (ms)
vim.opt.timeoutlen = 300        -- Key timeout (ms)
vim.opt.scrolloff = 8           -- Lines to keep above/below cursor

