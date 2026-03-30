#!/usr/bin/env bash
set -euo pipefail

REPO_RAW_BASE="${REPO_RAW_BASE:-https://raw.githubusercontent.com/你的用户名/gongyi/main}"
INSTALL_DIR="${HOME}/.local/bin"
TARGET="${INSTALL_DIR}/gongyi"

have_cmd() {
  command -v "$1" >/dev/null 2>&1
}

download() {
  local url="$1"
  local out="$2"

  if have_cmd curl; then
    curl -fsSL "$url" -o "$out"
  elif have_cmd wget; then
    wget -qO "$out" "$url"
  else
    echo "错误：未找到 curl 或 wget，请先安装其中一个。" >&2
    exit 1
  fi
}

ensure_python() {
  if ! have_cmd python3; then
    echo "错误：未找到 python3，请先安装 Python 3。" >&2
    exit 1
  fi
}

ensure_toml_module() {
  if python3 - <<'PY' >/dev/null 2>&1
try:
    import tomllib
except Exception:
    try:
        import toml
    except Exception:
        raise SystemExit(1)
PY
  then
    return
  fi

  echo "检测到缺少 TOML 解析模块，尝试自动安装 toml ..."
  if have_cmd pip3; then
    pip3 install --user toml
  else
    python3 -m pip install --user toml
  fi
}

ensure_path() {
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) return ;;
  esac

  echo
  echo "提示：~/.local/bin 当前不在 PATH 中。"
  echo "请把下面一行加入你的 shell 配置文件："
  echo
  echo 'export PATH="$HOME/.local/bin:$PATH"'
  echo
  echo "例如："
  echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
  echo "  source ~/.bashrc"
  echo
}

main() {
  echo "==> 开始安装 gongyi"

  ensure_python
  mkdir -p "$INSTALL_DIR"

  tmp_file="$(mktemp)"
  trap 'rm -f "$tmp_file"' EXIT

  echo "==> 下载主程序"
  download "${REPO_RAW_BASE}/gongyi" "$tmp_file"

  chmod +x "$tmp_file"
  mv "$tmp_file" "$TARGET"

  ensure_toml_module
  ensure_path

  echo
  echo "安装完成：$TARGET"
  echo "现在可以执行："
  echo
  echo "  gongyi"
  echo
}

main "$@"
