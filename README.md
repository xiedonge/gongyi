# gongyi

待办：openclaw的结构还未解析

一个用于 Linux 环境下管理“公益站”并快速切换 Codex / OpenClaw 配置的交互式命令行工具。

安装完成后，直接执行：

    gongyi

---

## 功能

- 交互式菜单
- 管理公益站预设
- 手动新增公益站时输入：
  - 公益站名称
  - 公益站 URL
  - API Key
- 自动保存到：

    ~/.config/gongyi/sites.json

- 下次可直接选择
- 列表显示格式：

    名称 - URL

- 自动备份配置文件
- 支持恢复备份
- OpenClaw 写入后自动执行：

    openclaw gateway restart

---

## 适用环境

- Linux
- Bash
- Python 3

---

## 一键安装

    bash <(curl -fsSL https://raw.githubusercontent.com/xiedonge/gongyi/main/install.sh)

安装完成后执行：

    gongyi

如果提示找不到命令，请执行：

    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

---

## 卸载

    bash <(curl -fsSL https://raw.githubusercontent.com/xiedonge/gongyi/main/uninstall.sh)

---

## 菜单结构

执行：

    gongyi

一级菜单：

    ========== Gongyi ==========
    1) Codex 配置
    2) OpenClaw 配置
    3) 公益站预设管理
    0) 退出

---

## 公益站预设文件

保存路径：

    ~/.config/gongyi/sites.json

示例：

    {
      "sites": [
        {
          "name": "站点A",
          "url": "https://api.example.com/v1",
          "api_key": "sk-xxxx"
        }
      ]
    }

---

## Codex 配置规则

### `~/.codex/config.toml`

例如你的文件可能是：

    base_url ="https://domain/v1"

程序会：

- 只替换**未注释**的 `base_url`
- 已注释的 `# base_url = ...` 不修改

### `~/.codex/auth.json`

例如：

    {
      "OPENAI_API_KEY": "sk-xxxxx"
    }

程序会：

- 替换 `OPENAI_API_KEY`
- 保留 `last_refresh`

---

## OpenClaw 配置规则

当前默认写入以下字段：

### `~/.openclaw/openclaw.json`

- `api.base_url = 公益站 URL`
- `api.key = API Key`

写入完成后自动执行：

    openclaw gateway restart

如果你的 `openclaw.json` 字段结构和这个不一致，可以再按你的真实文件结构调整。

---

## 备份文件

程序会自动生成：

- `~/.codex/config.toml.bak`
- `~/.codex/auth.json.bak`
- `~/.openclaw/openclaw.json.bak`

---

## 常见问题

### 找不到 gongyi 命令

执行：

    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc

### OpenClaw 没有生效

手动执行：

    openclaw gateway restart

### 配置文件不存在

程序会自动创建父目录和目标文件。

---

## 许可证

MIT
