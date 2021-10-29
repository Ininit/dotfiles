#!/usr/bin/env bash

formulas=(
  pynvim
)

for formula in "${formulas[@]}"; do
  if python3 -m pip show "$formula" >/dev/null 2>&1; then
    echo "$formula already installed... skipping."
  else
    python3 -m pip install --user --upgrade $formula
  fi
done
