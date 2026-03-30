#!/usr/bin/env bash
set -euo pipefail

TARGET="${HOME}/.local/bin/gongyi"

if [[ -f "$TARGET" ]]; then
  rm -f "$TARGET"
  echo "已卸载：$TARGET"
else
  echo "未找到：$TARGET"
fi
