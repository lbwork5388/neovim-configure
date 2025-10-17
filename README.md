# Neovim 配置

功能完整的现代化 Neovim IDE 配置，使用 lazy.nvim 管理插件。

## ✨ 特性

- 🔍 **Telescope** - 模糊查找文件和内容
- 🔀 **Git 集成** - 实时显示修改状态
- 🧠 **LSP** - 代码补全、跳转定义、错误诊断
- 🤖 **Codeium** - 免费 AI 代码补全
- 🔑 **Which-Key** - 快捷键提示
- 🎨 **Noice** - 美化命令行和通知
- 💬 **Comment** - 快速注释/取消注释
- 🔗 **Autopairs** - 自动括号配对
- 🌳 **文件树** - 侧边栏文件浏览

## 🚀 快速开始

### 1. 安装依赖

```bash
# macOS
brew install node npm git ripgrep

# ripgrep 用于 Telescope 快速搜索
```

### 2. 安装配置

```bash
# 克隆或复制此配置到 ~/.config/nvim
# 首次启动 Neovim
nvim

# 等待插件自动安装（2-3 分钟）
```

### 3. 认证 Codeium（首次使用）

```vim
" 打开任意文件后运行
:CodeiumAuth

" 在浏览器中用 GitHub/Google/邮箱登录
" 复制授权码粘贴到 Neovim
" 完成！
```

## ⌨️ 常用快捷键

> **注意**: `<leader>` 键是**空格键**

### 文件操作
- `空格 + f + f` - 查找文件 ⭐
- `空格 + f + g` - 全局搜索 ⭐
- `空格 + f + r` - 最近文件
- `空格 + f + b` - 查找缓冲区
- `空格 + e` - 打开/关闭文件树

### 代码导航
- `gd` - 跳转到定义
- `gr` - 查看引用
- `K` - 查看文档
- `[d` / `]d` - 上一个/下一个错误

### 代码编辑
- `空格 + r + n` - 重命名
- `空格 + c + a` - 代码操作
- `gcc` - 注释/取消注释当前行 ⭐
- `gc` (可视模式) - 注释选中的行

### AI 补全 (Codeium)
- `Ctrl + g` - 接受 AI 建议 ⭐
- `Ctrl + ;` - 下一个建议
- `Ctrl + x` - 清除建议

### Git 操作
- `]c` / `[c` - 下一个/上一个修改 ⭐
- `空格 + h + p` - 预览修改
- `空格 + h + r` - 撤销修改
- `空格 + h + s` - 暂存修改
- `空格 + h + b` - 查看 blame

### 其他
- `空格 + l` - 打开 Lazy 插件管理器
- `空格` (等待 0.3 秒) - 显示所有可用快捷键 ⭐

## 📁 目录结构

```
~/.config/nvim/
├── init.lua                    # 主入口文件
├── lua/
│   ├── config/
│   │   ├── options.lua        # 基本配置选项
│   │   └── lazy.lua           # lazy.nvim 配置
│   └── plugins/               # 插件配置目录
│       ├── telescope.lua      # 模糊查找
│       ├── git.lua            # Git 集成
│       ├── lsp.lua            # LSP 配置
│       ├── codeium.lua        # AI 补全
│       ├── which-key.lua      # 快捷键提示
│       ├── ui.lua             # UI 美化
│       ├── comment.lua        # 注释插件
│       ├── autopairs.lua      # 自动括号
│       ├── filetree.lua       # 文件树
│       └── treesitter.lua     # 语法高亮（已禁用）
├── README.md                  # 本文件
├── KEYBINDINGS.md             # 完整快捷键列表
└── QUICKSTART.md              # 快速开始指南
```

## 🔧 已安装的插件

### 核心功能

1. **Telescope** - 模糊查找器
   - 查找文件、搜索内容、浏览历史
   - 快捷键：`空格 + f + f`

2. **Git 集成** (gitsigns.nvim)
   - 实时显示 Git 修改状态
   - 预览、暂存、撤销修改
   - 快捷键：`]c` / `[c` 跳转修改

3. **LSP** (Language Server Protocol)
   - Mason: LSP 服务器管理器
   - 代码补全、跳转定义、错误诊断
   - 支持：Lua, Python, JavaScript, TypeScript, JSON, HTML, CSS, Bash

4. **Codeium** - AI 代码补全
   - 完全免费
   - 实时 AI 代码建议
   - 快捷键：`Ctrl + g` 接受建议

### UI 增强

5. **Which-Key** - 快捷键提示
   - 按 `空格` 等待 0.3 秒自动显示可用快捷键
   - 再也不用记忆所有快捷键

6. **Noice** - UI 美化
   - 弹出式命令行
   - 美化的搜索界面
   - 优雅的通知提示

7. **Indent-blankline** - 缩进线
   - 显示代码缩进结构
   - 自动生效

### 编辑工具

8. **Comment** - 快速注释
   - `gcc` 注释/取消注释当前行
   - 可视模式 + `gc` 批量注释

9. **Autopairs** - 自动括号配对
   - 输入 `(` 自动补全 `)`
   - 智能跳过和删除

10. **nvim-tree** - 文件树
    - 侧边栏文件浏览器
    - 快捷键：`空格 + e`

## 💡 使用技巧

### AI 补全最佳实践

```python
# 技巧 1：写注释让 AI 生成代码
# function to reverse a string
# Codeium 会建议完整实现

# 技巧 2：建立模式
user1 = User(name="Alice", age=25)
user2 = User(name="Bob", age=30)
# Codeium 会自动建议 user3...

# 技巧 3：函数签名
def calculate_average(numbers):
    # Codeium 会建议完整实现
```

### Which-Key 探索功能

```
不记得快捷键？
1. 按 空格
2. 等待 0.3 秒
3. 看提示窗口
4. 按对应字母
```

### Git 工作流

```
1. ]c - 跳到下一个修改
2. 空格 + h + p - 预览改了什么
3. 空格 + h + s - 满意就暂存
4. 空格 + h + r - 不满意就撤销
```

## 🛠️ 自定义配置

### 添加 LSP 服务器

编辑 `lua/plugins/lsp.lua`：

```lua
ensure_installed = {
  "lua_ls",
  "pyright",
  "your_new_lsp", -- 添加新的 LSP
}
```

### 修改快捷键

快捷键定义在各个插件配置文件中，直接修改对应文件。

### 禁用某个插件

在插件配置文件中添加 `enabled = false`：

```lua
{
  "plugin-name",
  enabled = false,  -- 禁用此插件
}
```

## 🆘 故障排查

### LSP 不工作？

```vim
:LspInfo        " 查看 LSP 状态
:Mason          " 检查服务器是否安装
:MasonInstall lua-language-server  " 手动安装
```

### Codeium 没有建议？

```vim
:CodeiumAuth    " 重新认证
:Codeium Status " 检查状态
```

### Telescope 找不到文件？

```bash
# 确保安装了 ripgrep
brew install ripgrep

# 在 Neovim 中检查
:checkhealth telescope
```

### Which-Key 不显示？

- 等待 0.3 秒（300ms）
- 检查是否在普通模式（按 `Esc`）

## 📚 更多资源

- `KEYBINDINGS.md` - 完整快捷键列表
- `QUICKSTART.md` - 新手快速开始指南
- `:help` - Neovim 内置帮助
- `:Telescope help_tags` - 搜索帮助文档

## 🎓 学习路径

### 第 1 天
- 熟悉 `空格 + f + f` 查找文件
- 学会 `gcc` 注释代码
- 试试 `Ctrl + g` 接受 AI 建议

### 第 2-3 天
- 掌握 Git 操作：`]c`, `空格 + h + p`
- 使用 `gd` 跳转定义
- 探索 Which-Key 发现新功能

### 第 1 周
- 熟练使用所有核心快捷键
- AI 补全成为肌肉记忆
- 编码效率显著提升

## 🚀 在其他机器上使用

```bash
# 1. 复制整个配置目录
cp -r ~/.config/nvim /path/to/backup

# 2. 在新机器上
# 确保已安装依赖
brew install node npm git ripgrep neovim

# 3. 复制配置
cp -r /path/to/backup ~/.config/nvim

# 4. 启动 Neovim
nvim

# 5. 等待插件自动安装
# 6. 认证 Codeium: :CodeiumAuth
```

## 📝 版本信息

- Neovim: 0.9+
- lazy.nvim: 最新稳定版
- 所有插件: 自动更新到最新版本

## 🤝 贡献

这是一个个人配置，但欢迎：
- 报告问题
- 提出改进建议
- 分享使用技巧

## 📄 许可

MIT License - 自由使用和修改

---

**享受你的现代化 Neovim IDE！** 🎉
