# 🚀 Neovim 配置快速开始指南

5 分钟上手你的新 IDE！

## 📦 安装步骤

### 1. 安装依赖

```bash
# macOS
brew install node npm git ripgrep neovim

# 检查版本
nvim --version  # 应该是 0.9+
```

### 2. 安装配置

```bash
# 如果已有旧配置，先备份
mv ~/.config/nvim ~/.config/nvim.backup

# 复制此配置到 ~/.config/nvim
# 或从 Git 克隆

# 启动 Neovim
nvim
```

首次启动会自动安装所有插件，等待 2-3 分钟。

### 3. 认证 Codeium AI

```vim
" 打开任意文件
:e test.py

" 运行认证命令
:CodeiumAuth

" 在浏览器中登录（GitHub/Google/邮箱）
" 复制授权码粘贴到 Neovim
" 完成！
```

---

## ⭐ 必会的 10 个快捷键

记住这些，你就能高效使用了！

| 快捷键 | 功能 | 重要度 |
|--------|------|--------|
| `空格 + f + f` | 查找文件 | ⭐⭐⭐ |
| `空格 + f + g` | 全局搜索 | ⭐⭐⭐ |
| `Ctrl + g` | 接受 AI 建议 | ⭐⭐⭐ |
| `gcc` | 注释/取消注释 | ⭐⭐⭐ |
| `空格 + e` | 文件树 | ⭐⭐ |
| `gd` | 跳转到定义 | ⭐⭐ |
| `K` | 查看文档 | ⭐⭐ |
| `]c` / `[c` | 下一个/上一个 Git 修改 | ⭐⭐ |
| `空格 + h + p` | 预览 Git 修改 | ⭐⭐ |
| `空格` (等待) | 显示所有快捷键 | ⭐⭐⭐ |

> **提示**: `空格` 是 leader 键，按下后等待 0.3 秒会自动显示可用选项！

---

## 🎯 5 分钟实战教程

### 任务 1: 查找文件 (1 分钟)

```
1. 按 空格 + f + f
2. 输入文件名的一部分（如 "conf"）
3. 上下键选择
4. 回车打开
```

**效果**: 比手动导航快 10 倍！

### 任务 2: 全局搜索 (1 分钟)

```
1. 按 空格 + f + g
2. 输入要搜索的内容（如 "function"）
3. 实时显示所有匹配
4. 回车跳转
```

**效果**: 瞬间找到代码位置！

### 任务 3: AI 辅助编码 (2 分钟)

```python
# 1. 创建新文件
:e test.py

# 2. 输入注释
# function to calculate factorial

# 3. 等待 1 秒，看到灰色的 AI 建议
# 4. 按 Ctrl+g 接受
# 5. 完整的函数就写好了！
```

**效果**: AI 帮你写代码！

### 任务 4: 快速注释 (30 秒)

```
1. 写几行代码
2. 光标放在某行
3. 按 gcc
4. 这行被注释了
5. 再按 gcc
6. 注释取消了
```

**效果**: 调试代码超快！

### 任务 5: Git 操作 (30 秒)

```
1. 修改一个已有文件
2. 左侧会显示修改标记（│）
3. 按 ]c 跳到修改处
4. 按 空格 + h + p 预览改动
5. 按 空格 + h + s 暂存，或 空格 + h + r 撤销
```

**效果**: Git 操作不用切换终端！

---

## 💡 核心功能速览

### 🔍 Telescope 模糊查找

**什么时候用**：
- 找文件：`空格 + f + f`
- 搜内容：`空格 + f + g`
- 找最近打开的：`空格 + f + r`

**为什么好用**：
- 模糊匹配（输入部分字母就能找到）
- 实时预览
- 快如闪电

### 🤖 Codeium AI 补全

**什么时候用**：
- 写新函数
- 实现标准功能
- 重复模式的代码

**如何使用**：
```python
# 方法 1: 写注释
# function to validate email address
# 等待 AI 建议，按 Ctrl+g

# 方法 2: 写函数签名
def send_email(to, subject, body):
    # AI 会建议完整实现
```

**技巧**：
- 看到灰色建议 = AI 在帮你
- `Ctrl+g` = 接受
- `Ctrl+;` = 下一个建议
- `Ctrl+x` = 不要了

### 🔀 Git 集成

**什么时候用**：
- 查看改了什么
- 快速暂存/撤销
- 查看谁改的代码

**如何使用**：
```
修改文件后，左侧会显示标记：
│ = 新增或修改
_ = 删除

操作：
]c - 跳到下一个修改
空格 + h + p - 预览改动
空格 + h + s - 暂存
空格 + h + r - 撤销
空格 + h + b - 查看 blame
```

### 🔑 Which-Key 快捷键提示

**什么时候用**：
- 忘记快捷键时
- 探索新功能时

**如何使用**：
```
1. 按 空格
2. 等 0.3 秒
3. 弹出菜单显示所有选项
4. 按对应字母继续

例如：
空格 → 看到 f(Find), g(Git), h(Hunk)...
空格 + f → 看到 f(Files), g(Grep), r(Recent)...
```

**好处**：边用边学，不用死记硬背！

### 💬 Comment 快速注释

**什么时候用**：
- 调试时临时注释代码
- 写文档注释
- 批量注释

**如何使用**：
```
普通模式：
gcc - 注释当前行（最常用！）
gc + j - 注释当前行和下一行
gc + 3j - 注释 4 行

可视模式：
1. V 选中几行
2. gc
3. 全部注释
```

---

## 🎓 第一周学习计划

### Day 1: 基础导航
- ✅ 学会查找文件: `空格 + f + f`
- ✅ 学会注释: `gcc`
- ✅ 学会文件树: `空格 + e`

### Day 2: AI 辅助
- ✅ 尝试 AI 补全: 写注释让 AI 生成代码
- ✅ 熟悉 `Ctrl + g` 接受建议

### Day 3: Git 集成
- ✅ 查看修改: `]c`, `空格 + h + p`
- ✅ 暂存/撤销: `空格 + h + s/r`

### Day 4: 代码导航
- ✅ 跳转定义: `gd`
- ✅ 查看文档: `K`
- ✅ 错误导航: `[d`, `]d`

### Day 5: 探索功能
- ✅ 使用 Which-Key 探索: 按 `空格` 等待
- ✅ 尝试不同的快捷键组合

### Day 6-7: 实践
- ✅ 用 Neovim 完成真实项目
- ✅ 总结最常用的快捷键
- ✅ 根据需要调整配置

**一周后，你会爱上这个配置！** ❤️

---

## 🆘 常见问题

### Q: 插件安装失败？

```vim
" 查看错误
:Lazy

" 重新安装
:Lazy sync

" 清理缓存重装
:Lazy clean
:Lazy sync
```

### Q: Codeium 不工作？

```vim
" 检查状态
:Codeium Status

" 重新认证
:CodeiumAuth

" 手动触发
Ctrl + Space (在插入模式)
```

### Q: LSP 没有代码补全？

```vim
" 检查 LSP
:LspInfo

" 检查服务器
:Mason

" 手动安装（以 Python 为例）
:MasonInstall pyright
```

### Q: 快捷键冲突？

- 所有快捷键都在 `lua/plugins/` 目录的对应文件中
- 直接修改即可
- 重启 Neovim 生效

### Q: 如何更新插件？

```vim
" 打开 Lazy
空格 + l

" 按 U 更新所有插件
" 按 S 同步（更安全）
```

---

## 🎨 个性化配置

### 修改主题

当前是默认主题。如果想要彩色主题：

1. 取消 `lua/plugins/treesitter.lua` 中的 `enabled = false`
2. 安装主题插件（如 tokyonight, catppuccin）
3. 重启 Neovim

### 修改快捷键

所有快捷键都在插件配置文件中，例如：

```lua
-- lua/plugins/telescope.lua
{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },

-- 改成你喜欢的
{ "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
```

### 添加新插件

在 `lua/plugins/` 创建新文件：

```lua
-- lua/plugins/my-plugin.lua
return {
  {
    "author/plugin-name",
    config = function()
      -- 配置
    end,
  },
}
```

---

## 🚀 在其他机器上使用

```bash
# 1. 打包配置
tar -czf nvim-config.tar.gz -C ~/.config nvim

# 2. 传输到新机器
scp nvim-config.tar.gz user@newmachine:~

# 3. 在新机器上解压
tar -xzf nvim-config.tar.gz -C ~/.config

# 4. 安装依赖
brew install node npm git ripgrep neovim

# 5. 启动
nvim

# 6. 等待插件自动安装
# 7. 认证 Codeium
:CodeiumAuth
```

---

## 📚 下一步

- 阅读 `README.md` 了解完整功能
- 查看 `KEYBINDINGS.md` 了解所有快捷键
- 加入社区交流使用心得

**开始你的高效编码之旅！** 🎉

---

## 📞 获取帮助

- 在 Neovim 中: `:help`
- 搜索帮助: `:Telescope help_tags`
- 查看插件文档: `空格 + l` 打开 Lazy，按回车查看详情
