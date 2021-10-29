#!/usr/bin/env bash

echo -e "\nInstalling nvm..."
echo "=============================="

if [ -e $HOME/.nvm ]; then
  echo "nvm already installed... skipping."
else
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

  nvm install --lts
  nvm use stable
fi

echo -e "\nInstalling nrm..."
echo "=============================="

if nrm -V >/dev/null 2>&1; then
  echo "nrm already installed... skipping."
else
  npm install nrm -g

  nrm ls
  # nrm use taobao
fi

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