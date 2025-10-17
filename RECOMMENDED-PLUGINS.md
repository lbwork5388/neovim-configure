# Recommended Plugins

## 🎯 Already Installed (You have these!)

✅ Telescope - Fuzzy finder
✅ LSP + Mason - Code intelligence
✅ Gitsigns - Git integration
✅ Which-Key - Key hints
✅ nvim-tree - File tree
✅ nvim-cmp - Auto-completion
✅ Codeium - AI completion
✅ Comment.nvim - Quick commenting
✅ nvim-autopairs - Auto pairs
✅ Noice - Better UI

---

## 🌟 Top Recommendations (Most Useful)

### 1. **Flash.nvim** - Lightning Fast Navigation ⚡
**What it does**: Jump to any location on screen with 2 keystrokes

**Why you need it**: Navigate code 10x faster than normal motions

```lua
-- Add to lua/plugins/flash.lua
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    },
  },
}
```

**Usage**: Press `s` + two letters → jump instantly!

---

### 2. **Trouble.nvim** - Better Diagnostics Panel 🔍
**What it does**: Beautiful list of errors, warnings, TODOs

**Why you need it**: See all problems in one place

```lua
-- Add to lua/plugins/trouble.lua
return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
    },
    opts = {},
  },
}
```

**Usage**: `<Space>xx` → see all errors/warnings

---

### 3. **Todo-Comments.nvim** - Highlight TODOs 📝
**What it does**: Highlight TODO, FIXME, NOTE, etc. in your code

**Why you need it**: Never miss important comments

```lua
-- Add to lua/plugins/todo-comments.lua
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    },
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = " ", color = "error" },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning" },
        PERF = { icon = " ", color = "default" },
        NOTE = { icon = " ", color = "hint" },
      },
    },
  },
}
```

**Usage**: Write `TODO: fix this` → auto-highlighted!

---

### 4. **mini.surround** - Surround Text 🎯
**What it does**: Add/change/delete surrounding quotes, brackets, tags

**Why you need it**: Edit text faster

```lua
-- Add to lua/plugins/mini-surround.lua
return {
  {
    "echasnovski/mini.surround",
    keys = { "sa", "sd", "sr" },
    opts = {
      mappings = {
        add = "sa",            -- Add surrounding
        delete = "sd",         -- Delete surrounding
        replace = "sr",        -- Replace surrounding
      },
    },
  },
}
```

**Usage**: 
- `sa"` → add quotes around word
- `sd"` → delete quotes
- `sr"'` → replace " with '

---

### 5. **nvim-colorizer** - Show Colors 🎨
**What it does**: Preview colors in your code (#ff0000, rgb(255,0,0))

**Why you need it**: Essential for CSS/frontend work

```lua
-- Add to lua/plugins/colorizer.lua
return {
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      user_default_options = {
        names = false,        -- Don't highlight color names
        rgb_fn = true,        -- CSS rgb() functions
        hsl_fn = true,        -- CSS hsl() functions
        css = true,           -- Enable all CSS features
        tailwind = true,      -- Enable Tailwind colors
      },
    },
  },
}
```

**Usage**: Automatic - colors are highlighted!

---

## 🚀 Advanced (For Power Users)

### 6. **Harpoon** - Quick File Switching
Pin your most-used files for instant access

```lua
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon Add" },
      { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
      { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
      { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
      { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
      { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
    },
  },
}
```

---

### 7. **nvim-spectre** - Project-wide Search & Replace
Find and replace across entire project

```lua
return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files" },
    },
  },
}
```

---

### 8. **undotree** - Undo History Visualizer
Never lose any change, see complete undo history

```lua
return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
    },
  },
}
```

---

### 9. **vim-illuminate** - Highlight Same Words
Highlight all occurrences of word under cursor

```lua
return {
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
```

---

### 10. **neogit** - Git Interface (Better than vim-fugitive)
Beautiful git interface inside Neovim

```lua
return {
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    opts = {},
  },
}
```

---

## 📦 My Personal Top 5 Picks

If you only add 5 plugins, choose these:

1. **Flash.nvim** - Game changer for navigation
2. **Trouble.nvim** - Much better error list
3. **Todo-Comments** - Never miss TODOs
4. **mini.surround** - Edit text faster
5. **Harpoon** - Quick file switching

---

## 🎯 Specialized Use Cases

### For Web Development
- nvim-colorizer (colors preview)
- vim-illuminate (highlight same words)
- todo-comments (TODO tracking)

### For Large Projects
- Harpoon (quick file access)
- nvim-spectre (project-wide replace)
- Trouble (better diagnostics)

### For Git Heavy Work
- neogit (beautiful git UI)
- (You already have gitsigns!)

### For Writing/Documentation
- todo-comments (mark todos)
- undotree (never lose changes)

---

## 🚀 Quick Install

Want to try Flash.nvim? Just create the file:

```bash
nvim ~/.config/nvim/lua/plugins/flash.lua
```

Paste the config, restart Neovim, and press `s` + two letters!

---

## 💡 Installation Instructions

1. **Create new file** in `~/.config/nvim/lua/plugins/`
2. **Paste the config** from above
3. **Restart Neovim** (lazy.nvim auto-installs)
4. **Try the keybindings**

Example:
```bash
cd ~/.config/nvim/lua/plugins
nvim flash.lua  # Create and paste config
# Restart Neovim
# Press 's' + two letters to jump!
```

---

## ❓ Which Should You Try First?

**Start with Flash.nvim** - It's the most impactful plugin for daily coding. You'll wonder how you lived without it!

Then add **Trouble.nvim** and **Todo-Comments** - both are simple but super useful.

