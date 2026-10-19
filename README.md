# Neovim Configuration

**neovim version: 0.11.4**

A modern, feature-rich Neovim IDE configuration with LSP, AI completion, and powerful plugins.

## ✨ Features

- 🔍 **Telescope** - Fuzzy finder for files and content
- 🧠 **LSP** - Code intelligence (completion, diagnostics, jump to definition)
- 🤖 **GitHub Copilot** - AI suggestions with separate completion shortcuts
- 🔀 **Git Integration** - Real-time diff and git operations
- ⚡ **Flash** - Lightning fast navigation (jump anywhere with 2 keystrokes)
- 🔍 **Trouble** - Better diagnostics panel
- 🔑 **Which-Key** - Keybinding hints (press `Space` and wait)
- 💬 **Smart Editing** - Auto-pairs, comments, and more
- 🌳 **File Tree** - Sidebar file explorer
- 🎨 **Beautiful UI** - Enhanced command-line and notifications

## 🚀 Quick Start

### Installation

```bash
# 1. Install dependencies (macOS)
brew install node npm git ripgrep neovim

# Nerd Font (if you want to use icons, required by which-key)
brew install --cask font-jetbrains-mono-nerd-font

# 2. Clone or copy this config
git clone <your-repo> ~/.config/nvim
# OR copy manually to ~/.config/nvim

# 3. Start Neovim (plugins auto-install)
nvim
```

### Copilot Login

Inside Neovim, run:

```vim
:Copilot auth signin
```

Keep the login popup open. Visit the URL shown in the popup, enter the one-time code, and authorize your GitHub account. Wait for the popup to close automatically, then check:

```vim
:Copilot auth info
:Copilot status
```

Authentication should report `OK`. `Online` and `Buffer status: attached` only describe the plugin connection; they do not by themselves confirm a valid login. Your GitHub account needs access to Copilot. Sign in separately on each new machine; credentials are not included in this repository.

### First Steps

```bash
# Open a file
nvim myfile.py

# Press Space → see all available commands!
# Press 's' + two letters → jump instantly (Flash)
# Type code → AI suggestions appear → Ctrl+g to accept
```

## ⌨️ Essential Keybindings

> **Note**: `<leader>` = `Space` key

### Quick Reference

| Action | Keys | Description |
|--------|------|-------------|
| **Find file** | `Space f f` | Fuzzy find files ⭐ |
| **Search text** | `Space f g` | Live grep in project ⭐ |
| **Flash jump** | `s` + 2 letters | Jump anywhere instantly ⭐ |
| **File tree** | `Space e` | Toggle file explorer |
| **Show keys** | `Space` (wait) | Show all keybindings ⭐ |

### Code Navigation

| Action | Keys | Description |
|--------|------|-------------|
| Go to definition | `gd` | Jump to definition |
| Go to references | `gr` | Show all references |
| Hover docs | `K` | Show documentation |
| Next/prev diagnostic | `]d` / `[d` | Navigate errors |

### Code Editing

| Action | Keys | Description |
|--------|------|-------------|
| Rename | `Space r n` | Rename symbol |
| Code action | `Space c a` | Show code actions |
| Comment line | `gcc` | Toggle comment ⭐ |
| Comment block | `gc` (visual) | Comment selection |

### AI Completion (GitHub Copilot)

Copilot suggestions appear automatically as gray text while typing in supported code files. The first three shortcuts below work in insert mode; the `Space` shortcuts work in normal mode.

| Action | Keys | Description |
|--------|------|-------------|
| Accept suggestion | `Ctrl g` | Accept the full AI suggestion ⭐ |
| Accept one line | `Ctrl l` | Accept the next line of the AI suggestion |
| Dismiss suggestion | `Ctrl ]` | Hide the current AI suggestion |
| Check status | `Space c s` | Run `:Copilot status` |
| Enable Copilot | `Space c e` | Run `:Copilot enable` |
| Disable Copilot | `Space c d` | Run `:Copilot disable` |

### Standard Completion (nvim-cmp)

LSP, buffer, path, and LuaSnip completion remain enabled. In insert mode:

| Action | Keys | Description |
|--------|------|-------------|
| Next item / snippet jump | `Tab` | Select the next menu item; otherwise expand or jump through a snippet, or insert normal indentation |
| Previous item / snippet jump | `Shift Tab` | Select the previous menu item or jump back in a snippet |
| Trigger completion | `Ctrl Space` | Open the standard completion menu |
| Confirm completion | `Enter` | Accept the selected item, or the first item when none is selected |
| Close completion menu | `Ctrl e` | Cancel standard completion |

Copilot does not bind `Tab` or `Ctrl Space`. AI suggestions are hidden while the standard completion menu is open, so the two completion systems do not compete for the same keys or display space.

### Git Operations

| Action | Keys | Description |
|--------|------|-------------|
| Next/prev hunk | `]c` / `[c` | Jump to changes ⭐ |
| Preview hunk | `Space h p` | Preview diff |
| Stage hunk | `Space h s` | Stage changes |
| Reset hunk | `Space h r` | Undo changes |
| Blame line | `Space h b` | Show git blame |

### Diagnostics (Trouble)

| Action | Keys | Description |
|--------|------|-------------|
| Show diagnostics | `Space x x` | Open Trouble panel |
| Buffer diagnostics | `Space x X` | Current file only |

### Other

| Action | Keys | Description |
|--------|------|-------------|
| Plugin manager | `Space l` | Open Lazy.nvim |
| Command history | `:` then `Ctrl p` | Previous commands |

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                   # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua       # Basic settings
│   │   └── lazy.lua          # Plugin manager
│   └── plugins/              # Plugin configs (10 files)
│       ├── telescope.lua     # Fuzzy finder
│       ├── lsp.lua           # LSP + completion
│       ├── copilot.lua       # AI completion
│       ├── flash.lua         # Fast navigation
│       ├── trouble.lua       # Diagnostics panel
│       ├── git.lua           # Git integration
│       ├── which-key.lua     # Key hints
│       ├── filetree.lua      # File explorer
│       ├── comment.lua       # Quick comments
│       ├── autopairs.lua     # Auto brackets
│       └── ui.lua            # UI enhancements
└── README.md                  # This file
```

## 🔧 Configuration

### LSP Servers (Auto-installed)

Supports: Lua, Python, TypeScript/JavaScript, JSON, HTML, CSS, Bash

**Add more servers**: Edit `lua/plugins/lsp.lua`
```lua
ensure_installed = {
  "lua_ls",
  "pyright",
  "your_new_server",  -- Add here
}
```

### Customize Keybindings

Keybindings are defined in each plugin file. Example:

**Change Flash key**: Edit `lua/plugins/flash.lua`
```lua
keys = {
  { "f", mode = { "n", "x", "o" }, ... },  -- Change 's' to 'f'
}
```

### Disable a Plugin

Add `enabled = false` to any plugin config:
```lua
{
  "plugin-name",
  enabled = false,  -- Plugin won't load
}
```

### Color Scheme (Optional)

```bash
# Enable colorscheme
cd ~/.config/nvim/lua/plugins
mv colorscheme-optional.lua.example colorscheme.lua

# Edit options.lua: set termguicolors = true
nvim
```

## 💡 Usage Tips

### AI Completion Best Practices

```python
# Tip 1: Write comments, let AI generate code
# function to calculate fibonacci numbers
# → Copilot suggests full implementation

# Tip 2: Establish patterns
user1 = User(name="Alice", age=25)
user2 = User(name="Bob", age=30)
# → Copilot suggests user3, user4...

# Tip 3: Function signatures
def sort_list(items, reverse=False):
    # → Copilot suggests complete implementation
```

### Flash Navigation Example

```
Open any file with code
Press 's'
Type 'de' (first two letters of 'def')
→ Jump labels appear on all 'def' locations
Press the label → instant jump!
```

### Git Workflow

```
1. Write code
2. Press ]c → jump to your changes
3. Press Space h p → preview what changed
4. Press Space h s → stage if good
5. Press Space h r → reset if bad
```

### Explore with Which-Key

```
Press Space
Wait 0.3 seconds
→ Menu shows all commands
Press any letter to see submenus
Never memorize keybindings again!
```

## 🐛 Troubleshooting

### LSP not working?
```vim
:LspInfo           " Check LSP status
:Mason             " Verify servers installed
```

### Copilot has no suggestions or reports an expired session?

Check the account and plugin status:

```vim
:Copilot auth info
:Copilot status
```

If you are signed out or the session has expired, run `:Copilot auth signout`, wait for the sign-out message, then run `:Copilot auth signin` and complete the browser authorization. If an old error remains after successful authorization, save your files, restart Neovim, and check `:Copilot auth info` again.

To enable suggestions, run `:Copilot enable`. Open a supported code file, enter insert mode, and type. Close the standard completion menu with `Ctrl e` if it is covering AI suggestions. Use `Ctrl g` to accept AI text; `Tab` belongs to standard completion and snippets.

### Telescope can't find files?
```bash
brew install ripgrep    # Install dependency
:checkhealth telescope  # Check health
```

### Flash not working?
Restart Neovim after installation: `:qa` then `nvim`

## 📦 Deployment to Other Machines

```bash
# Package config
cd ~/.config
tar -czf nvim-config.tar.gz nvim/

# On new machine:
# 1. Install dependencies
brew install node npm git ripgrep neovim

# 2. Extract config
tar -xzf nvim-config.tar.gz -C ~/.config/

# 3. Start Neovim (auto-install plugins)
nvim
```

In Neovim, run `:Copilot auth signin` and follow the [Copilot login steps](#copilot-login).

## 🎓 Learning Path

**Day 1**: Learn 3 commands
- `Space f f` - Find files
- `gcc` - Comment code  
- `Ctrl g` - Accept AI suggestions

**Day 2-3**: Add 3 more
- `s` + letters - Flash navigation
- `]c` / `[c` - Jump to git changes
- `Space` (wait) - Explore with which-key

**Week 1**: You're productive!
- All keybindings become muscle memory
- AI completion feels natural
- Coding efficiency 10x improved

## 🌟 Plugin Credits

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP config
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP installer
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua) - AI completion
- [flash.nvim](https://github.com/folke/flash.nvim) - Navigation
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostics
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Key hints
- And more...

## 📝 Requirements

- Neovim 0.11+ (this configuration uses the Neovim 0.11 LSP API)
- Node.js (for LSP servers)
- Git (for plugin management)
- ripgrep (for Telescope search)
- A GitHub account with Copilot access (for AI suggestions)
- Internet access for plugin installation, Copilot sign-in, and AI suggestions

## 📄 License

MIT License - Free to use and modify

---

**Enjoy your modern Neovim IDE!** 🎉

**Quick Help**: Press `Space` in Neovim and wait 0.3s to see all commands!
