#!/usr/bin/env bash

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/
# cd "$(brew --repo)"
# git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
# git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

echo -e "\nUpgrade homebrew packages..."
brew update
brew upgrade

echo -e "\nInstalling homebrew packages..."
echo "=============================="

formulas=(
  ruby
  fish
  ripgrep
  fzf
  tmux
  git
  tree
  wget
  neovim
  cmake
  fx
  bat
  fd
  htop
  reattach-to-user-namespace
  ctags
  borkdude/brew/clj-kondo
  golang
  rust
  autojump
  urlview
  starship
# === cask === #
  squirrel
  upic
  dash
  wireshark
  raycast
  bob
  obsidian
)

for formula in "${formulas[@]}"; do
  if brew list "$formula" >/dev/null 2>&1; then
    echo "$formula already installed... skipping."
  else
    brew install $formula
  fi
done
