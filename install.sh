#!/usr/bin/env bash
set -euo pipefail

REPO_RAW_BASE="https://raw.githubusercontent.com/xiedonge/gongyi/main"
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
    echo "错误：未找到 curl 或 wget，请先安装其中一个。"
    exit 1
  fi
}

ensure_python() {
  if ! have_cmd python3; then
    echo "错误：未找到 python3，请先安装 Python 3。"
    exit 1
  fi
}

ensure_path() {
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) return ;;
  esac

  echo
  echo "提示：~/.local/bin 当前不在 PATH 中。"
  echo "请执行以下命令加入 PATH："
  echo
  echo 'echo '\''export PATH="$HOME/.local/bin:$PATH"'\'' >> ~/.bashrc'
  echo 'source ~/.bashrc'
  echo
}

main() {
  echo "==> 开始安装 gongyi"

  ensure_python
  mkdir -p "$INSTALL_DIR"

  local tmp_file
  tmp_file="$(mktemp)"
  trap 'rm -f "$tmp_file"' EXIT

  echo "==> 下载主程序"
  download "${REPO_RAW_BASE}/gongyi" "$tmp_file"

  chmod +x "$tmp_file"
  mv "$tmp_file" "$TARGET"

  ensure_path

  echo
  echo "安装完成：$TARGET"
  echo "现在可以执行："
  echo "  gongyi"
  echo
}

main "$@"
