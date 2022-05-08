#!/bin/sh

export PATH="$PATH:/opt/homebrew/bin"

pwd

if which mint >/dev/null; then
  mint run swiftlint || true
else
  echo "warning: Mint not installed, run `brew install mint` or check out https://github.com/yonaskolb/Mint"
fi
