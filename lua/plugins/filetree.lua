-- File tree (nvim-tree)
return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- File icons
    },
    config = function()
      -- Disable netrw (Neovim's built-in file browser)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        -- Sort method
        sort_by = "case_sensitive",
        
        -- View configuration
        view = {
          width = 30,
          side = "left",
        },
        
        -- Renderer configuration
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        
        -- Filters
        filters = {
          dotfiles = false, -- Show hidden files
          custom = { "^.git$" }, -- Hide .git folder
        },
        
        -- Git integration
        git = {
          enable = true,
          ignore = false,
        },
        
        -- Filesystem watchers
        filesystem_watchers = {
          enable = true,
        },
        
        -- Actions
        actions = {
          open_file = {
            quit_on_open = false,
            resize_window = true,
          },
        },
      })

      -- Key bindings
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle Tree" })
      vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { silent = true, desc = "Find File" })
      vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { silent = true, desc = "Collapse Tree" })
    end,
  },

  -- Icon support
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },
}

