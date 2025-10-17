# Indent Line Options

## Current Setting: Subtle (Soft gray, thin lines)

If you want to completely disable indent lines, edit `lua/plugins/ui.lua`:

### Option 1: Keep Current (Subtle)
```lua
-- Already applied - soft gray thin lines
char = "┊",
enabled = true,
```

### Option 2: Complete Disable
Find the indent-blankline section and add at the top:
```lua
{
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,  -- Add this line to disable completely
  main = "ibl",
  ...
}
```

### Option 3: Only Show on Current Scope
```lua
indent = {
  char = "┊",
},
scope = {
  enabled = true,  -- Change to true
  show_start = true,
  show_end = false,
},
```

### Option 4: Different Characters
Try different characters:
- `"┊"` - Thin dotted (current)
- `"·"` - Very subtle dot
- `"╎"` - Dashed line
- `"▏"` - Left block
- `" "` - Invisible (space)

## Quick Toggle Command

You can also toggle indent lines on/off without editing files:

```vim
:IBLDisable  " Disable for current buffer
:IBLEnable   " Enable for current buffer
```

To disable globally at runtime:
```vim
:lua require("ibl").setup_buffer(0, { enabled = false })
```

