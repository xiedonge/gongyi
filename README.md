# gongyi

一个用于 Linux 环境下快速切换 **Codex** 和 **OpenClaw** 配置的交互式命令行工具。

安装完成后，直接执行：

    gongyi

即可通过菜单方式修改以下配置文件：

- `~/.codex/config.toml`
- `~/.codex/auth.json`
- `~/.openclaw/openclaw.json`

---

## 功能特性

- 交互式菜单操作
- 一级菜单先选择：
  - `Codex 配置`
  - `OpenClaw 配置`
- 支持预置配置切换
- 支持手动逐项修改配置
- 自动备份原文件
- 支持恢复备份
- 支持查看当前配置
- 支持一键安装
- 支持 GitHub Raw 脚本分发

---

## 适用环境

- Linux
- Bash
- Python 3

---

## 依赖要求

本项目依赖以下环境：

- `bash`
- `curl` 或 `wget`
- `python3`

如果系统 Python 版本较低，且没有内置 TOML 支持，则需要安装：

    pip3 install --user toml

---

## 一键安装

将下面命令中的 `YOUR_GITHUB_USERNAME` 替换成你的 GitHub 用户名：

    bash <(curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/install.sh)

安装完成后，执行：

    gongyi

如果提示找不到命令，请将 `~/.local/bin` 加入 `PATH`：

    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

---

## 卸载

    bash <(curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/uninstall.sh)

---

## 使用说明

安装完成后，执行：

    gongyi

会出现一级菜单：

    ========== Gongyi ==========
    1) Codex 配置
    2) OpenClaw 配置
    0) 退出

### Codex 菜单

进入后可操作：

- 使用预置配置
- 手动配置 `config.toml`
- 手动配置 `auth.json`
- 查看当前配置
- 恢复备份

### OpenClaw 菜单

进入后可操作：

- 使用预置配置
- 手动配置 `openclaw.json`
- 查看当前配置
- 恢复备份

---

## 默认支持的字段

### Codex

#### `~/.codex/config.toml`

- `model`
- `base_url`
- `workspace.name`

#### `~/.codex/auth.json`

- `access_token`
- `refresh_token`

### OpenClaw

#### `~/.openclaw/openclaw.json`

- `api.base_url`
- `api.key`

---

## 自定义预置配置

工具支持从以下文件读取用户自定义预置：

    ~/.config/gongyi/presets.env

你可以创建该文件，例如：

    mkdir -p ~/.config/gongyi

然后编辑：

    ~/.config/gongyi/presets.env

示例内容如下：

    DEV_CODEX_MODEL="gpt-4.1"
    DEV_CODEX_BASE_URL="https://api.example-dev.com"
    DEV_CODEX_WORKSPACE="dev-workspace"
    DEV_CODEX_ACCESS_TOKEN="your_dev_access_token"
    DEV_CODEX_REFRESH_TOKEN="your_dev_refresh_token"
    DEV_OPENCLAW_BASE_URL="https://openclaw-dev.example.com"
    DEV_OPENCLAW_API_KEY="your_dev_openclaw_key"

    PROD_CODEX_MODEL="gpt-4o"
    PROD_CODEX_BASE_URL="https://api.example.com"
    PROD_CODEX_WORKSPACE="prod-workspace"
    PROD_CODEX_ACCESS_TOKEN="your_prod_access_token"
    PROD_CODEX_REFRESH_TOKEN="your_prod_refresh_token"
    PROD_OPENCLAW_BASE_URL="https://openclaw.example.com"
    PROD_OPENCLAW_API_KEY="your_prod_openclaw_key"

保存后重新执行：

    gongyi

即可生效。

---

## 项目结构

推荐项目结构如下：

    gongyi/
    ├── gongyi
    ├── install.sh
    ├── uninstall.sh
    ├── README.md
    ├── .gitignore
    └── LICENSE

文件说明：

- `gongyi`：主程序
- `install.sh`：安装脚本
- `uninstall.sh`：卸载脚本
- `README.md`：项目说明文档
- `.gitignore`：Git 忽略规则
- `LICENSE`：开源许可证

---

## 部署步骤

下面是完整的 GitHub 部署流程。

### 1. 本地创建项目目录

    mkdir gongyi
    cd gongyi

将以下文件放入该目录：

- `gongyi`
- `install.sh`
- `uninstall.sh`
- `README.md`

建议同时补充：

- `.gitignore`
- `LICENSE`

---

### 2. 设置脚本可执行权限

    chmod +x gongyi install.sh uninstall.sh

---

### 3. 初始化 Git 仓库

    git init

---

### 4. 添加文件并提交

    git add .
    git commit -m "init gongyi"

---

### 5. 在 GitHub 创建仓库

在 GitHub 上新建一个仓库，例如：

- 仓库名：`gongyi`

假设你的 GitHub 用户名为：

- `YOUR_GITHUB_USERNAME`

那么仓库地址通常为：

    https://github.com/YOUR_GITHUB_USERNAME/gongyi

---

### 6. 关联远程仓库

如果你使用 SSH：

    git branch -M main
    git remote add origin git@github.com:YOUR_GITHUB_USERNAME/gongyi.git

如果你使用 HTTPS：

    git branch -M main
    git remote add origin https://github.com/YOUR_GITHUB_USERNAME/gongyi.git

---

### 7. 推送到 GitHub

    git push -u origin main

---

### 8. 验证 Raw 地址是否可访问

上传成功后，检查以下地址是否能正常访问：

#### install.sh

    https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/install.sh

#### uninstall.sh

    https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/uninstall.sh

#### gongyi

    https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/gongyi

你可以在浏览器中打开，也可以命令行测试：

    curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/install.sh | head

如果能看到脚本内容，说明部署成功。

---

### 9. 测试一键安装

在本机或另一台 Linux 机器执行：

    bash <(curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/install.sh)

安装完成后执行：

    gongyi

---

### 10. 测试卸载

    bash <(curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/uninstall.sh)

---

## 本地开发调试

如果你不想每次都重新安装，可以直接本地运行：

    bash ./gongyi

或者：

    chmod +x ./gongyi
    ./gongyi

---

## 更新项目后的发布流程

当你修改脚本内容后，执行：

    git add .
    git commit -m "update gongyi"
    git push

推送成功后，GitHub Raw 地址会自动更新。

---

## 备份说明

每次写入配置文件时，程序会自动创建备份文件：

- `~/.codex/config.toml.bak`
- `~/.codex/auth.json.bak`
- `~/.openclaw/openclaw.json.bak`

你可以通过菜单中的“恢复备份”功能回滚配置。

---

## 常见问题

### 1. 安装后执行 `gongyi` 提示 command not found

请确认 `~/.local/bin` 是否在 `PATH` 中：

    echo $PATH

如果没有，请执行：

    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

---

### 2. 缺少 toml 模块

如果运行时报错缺少 `toml`，执行：

    pip3 install --user toml

---

### 3. 无法访问 raw.githubusercontent.com

这通常是网络问题，可以尝试：

- 更换网络环境
- 使用代理
- 先手动下载脚本再执行

例如：

    curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/gongyi/main/install.sh -o install.sh
    bash install.sh

---

### 4. 配置文件不存在怎么办

程序在写入时会自动创建父目录和目标文件。

---

## 推荐补充文件

### `.gitignore`

建议内容：

    *.bak

### `LICENSE`

推荐使用 MIT License。

---

## 安全提示

本工具会修改以下本地配置文件：

- `~/.codex/config.toml`
- `~/.codex/auth.json`
- `~/.openclaw/openclaw.json`

请在使用前确认预置配置内容正确，尤其注意以下敏感字段：

- `access_token`
- `refresh_token`
- `api.key`

建议不要把真实敏感信息直接写入公开仓库，优先通过本地配置覆盖：

    ~/.config/gongyi/presets.env

---

## 许可证

MIT
