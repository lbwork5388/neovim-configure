# 📦 安装和部署指南

快速在任何机器上部署此 Neovim 配置。

## 🎯 完整文件列表

```
~/.config/nvim/
├── init.lua                    # 主入口（必需）
├── lazy-lock.json              # 插件版本锁定（自动生成）
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # 插件管理器配置（必需）
│   │   └── options.lua        # 基本选项（必需）
│   └── plugins/               # 插件配置（必需）
│       ├── autopairs.lua      # 自动括号
│       ├── codeium.lua        # AI 补全
│       ├── comment.lua        # 注释
│       ├── filetree.lua       # 文件树
│       ├── git.lua            # Git 集成
│       ├── lsp.lua            # LSP
│       ├── telescope.lua      # 模糊查找
│       ├── treesitter.lua     # 语法高亮（已禁用）
│       ├── ui.lua             # UI 美化
│       └── which-key.lua      # 快捷键提示
├── README.md                  # 说明文档
├── QUICKSTART.md              # 快速开始
├── KEYBINDINGS.md             # 快捷键列表
└── INSTALL.md                 # 本文件
```

---

## 🚀 方法 1：直接复制（推荐）

### 在当前机器上打包

```bash
# 1. 切换到配置目录
cd ~/.config

# 2. 打包（不包含缓存和数据文件）
tar -czf nvim-config.tar.gz \
    nvim/init.lua \
    nvim/lua \
    nvim/README.md \
    nvim/QUICKSTART.md \
    nvim/KEYBINDINGS.md \
    nvim/INSTALL.md

# 3. 查看压缩包
ls -lh nvim-config.tar.gz
```

### 在新机器上部署

```bash
# 1. 安装依赖
brew install neovim node npm git ripgrep

# 2. 备份旧配置（如果有）
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d)

# 3. 解压新配置
tar -xzf nvim-config.tar.gz -C ~/.config

# 4. 启动 Neovim（自动安装插件）
nvim

# 5. 等待 2-3 分钟，直到所有插件安装完成

# 6. 认证 Codeium
# 在 Neovim 中运行：:CodeiumAuth
```

---

## 📋 方法 2：使用 Git（团队共享）

### 初始化 Git 仓库

```bash
cd ~/.config/nvim

# 创建 .gitignore
cat > .gitignore << 'EOF'
# 忽略自动生成的文件
lazy-lock.json
.nvimlog

# 忽略插件数据（会自动下载）
/plugin
EOF

# 初始化仓库
git init
git add .
git commit -m "Initial Neovim config"

# 推送到远程（可选）
git remote add origin https://github.com/yourusername/nvim-config.git
git push -u origin main
```

### 在新机器上克隆

```bash
# 1. 安装依赖
brew install neovim node npm git ripgrep

# 2. 克隆配置
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim

# 3. 启动 Neovim
nvim

# 4. 认证 Codeium
:CodeiumAuth
```

---

## 🔧 方法 3：手动复制（最简单）

如果只有几台机器，可以直接复制文件：

```bash
# 从源机器复制到目标机器
scp -r ~/.config/nvim user@targetmachine:~/.config/

# 或使用 rsync
rsync -av ~/.config/nvim/ user@targetmachine:~/.config/nvim/
```

---

## ✅ 部署检查清单

### 必需的系统依赖

- [ ] Neovim >= 0.9.0
  ```bash
  nvim --version
  ```

- [ ] Node.js 和 npm（LSP 和部分插件需要）
  ```bash
  node --version
  npm --version
  ```

- [ ] Git（插件管理器需要）
  ```bash
  git --version
  ```

- [ ] ripgrep（Telescope 搜索需要）
  ```bash
  rg --version
  ```

### 可选依赖

- [ ] Python 3（如果要用 Python LSP）
  ```bash
  python3 --version
  ```

- [ ] 编译器（LSP 服务器可能需要）
  ```bash
  gcc --version  # 或 clang --version
  ```

### 首次启动检查

启动 Neovim 后，检查这些：

```vim
" 1. 检查插件
:Lazy

" 2. 检查 LSP
:Mason

" 3. 检查 Codeium
:Codeium Status

" 4. 检查 Treesitter（如果启用）
:TSInstallInfo

" 5. 整体健康检查
:checkhealth
```

---

## 🎓 首次使用步骤

### 1. 认证 Codeium

```vim
:CodeiumAuth
```

在浏览器中登录，复制授权码粘贴。

### 2. 测试核心功能

```vim
" 查找文件
:Telescope find_files

" 或使用快捷键
空格 + f + f
```

### 3. 测试 AI 补全

创建测试文件：
```vim
:e test.py
```

输入：
```python
def hello
```

等待看到灰色的 AI 建议，按 `Ctrl + g` 接受。

### 4. 测试 LSP

打开 Python 文件：
```python
import os
os.  # 应该看到自动补全
```

---

## 🔄 更新配置

如果你在一台机器上更新了配置，同步到其他机器：

### 使用 Git

```bash
# 在更新的机器上
cd ~/.config/nvim
git add .
git commit -m "Update config"
git push

# 在其他机器上
cd ~/.config/nvim
git pull
```

### 使用 rsync

```bash
# 从源机器推送
rsync -av ~/.config/nvim/ user@targetmachine:~/.config/nvim/

# 或从目标机器拉取
rsync -av user@sourcemachine:~/.config/nvim/ ~/.config/nvim/
```

---

## 🆘 常见部署问题

### 问题 1：插件安装失败

**原因**：网络问题或缺少 Git

**解决**：
```vim
" 检查网络
:Lazy log

" 重新安装
:Lazy sync

" 清理后重装
:Lazy clean
:Lazy sync
```

### 问题 2：LSP 服务器安装失败

**原因**：缺少编译器或系统依赖

**解决**：
```bash
# macOS 安装 Xcode Command Line Tools
xcode-select --install

# 检查 Mason 日志
:MasonLog
```

### 问题 3：ripgrep 未安装

**症状**：Telescope 搜索不工作

**解决**：
```bash
# macOS
brew install ripgrep

# 验证
rg --version
```

### 问题 4：Codeium 认证失败

**解决**：
```vim
" 清除旧认证
:Codeium Disable

" 重新认证
:CodeiumAuth
```

---

## 📊 不同系统的依赖安装

### macOS

```bash
# 使用 Homebrew
brew install neovim node npm git ripgrep
```

### Ubuntu/Debian

```bash
# 添加 Neovim PPA（获取最新版本）
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# 安装依赖
sudo apt install neovim nodejs npm git ripgrep
```

### Arch Linux

```bash
sudo pacman -S neovim nodejs npm git ripgrep
```

### Windows (WSL)

在 WSL 中使用 Linux 的安装方法。

---

## 🎯 最小化配置（测试用）

如果想测试基本功能，可以只复制核心文件：

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins/
│       ├── lsp.lua          # 最基础的代码补全
│       └── telescope.lua    # 文件查找
```

其他插件可以后续添加。

---

## 📝 版本兼容性

### 已测试环境

- ✅ Neovim 0.9.5 (macOS)
- ✅ Neovim 0.10.0 (macOS)
- ✅ Neovim 0.11.4 (macOS)

### 插件版本

所有插件使用最新稳定版，通过 `lazy-lock.json` 锁定版本。

如果遇到兼容性问题，可以：
1. 删除 `lazy-lock.json`
2. 运行 `:Lazy restore` 恢复
3. 或 `:Lazy update` 更新所有插件

---

## 🎉 部署完成！

部署后，阅读以下文档：

1. `QUICKSTART.md` - 5 分钟快速上手
2. `README.md` - 完整功能说明
3. `KEYBINDINGS.md` - 所有快捷键

**享受你的现代化 Neovim IDE！** 🚀

