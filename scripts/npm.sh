#!/usr/bin/env bash

echo -e "\nInstalling pnpm packages..."
echo "=============================="

if pnpm -v >/dev/null 2>&1; then
  echo "pnpm already installed... skipping."
else
  curl -f https://get.pnpm.io/v6.js | node - add --global pnpm
fi

echo -e "\nInstalling npm packages..."
echo "=============================="

formulas=(
  leetcode-cli
  neovim
  prettier
  typescript
  commitizen
  cz-conventional-changelog
  eslint
  @ininit/eslint-config
  ts-node
  vercel
  ndb
)

for formula in "${formulas[@]}"; do
  if  test "$(pnpm list -g --depth=0 "$formula")"; then
    echo "$formula already installed... skipping."
  else
    pnpm add $formula -g
  fi
done
