#!/usr/bin/env bash

RIME_CONFIG=$HOME/Library/Rime

for config in $DOTFILES/rime/*; do
  filename="$(basename $config)"
  target="$RIME_CONFIG/$filename"
  if [ -e $target ]; then
    echo "$target already exists... Skipping."
  else
    echo "Creating symlink for $config"
    ln -s $config $target
  fi
done
