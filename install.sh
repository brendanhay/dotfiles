#!/bin/bash

backup="dotfiles.backup"

for name in *; do
  target="$HOME/.$name"

  if [[ $name != 'install.sh' ]]; then
    if [ -e $target ]; then
      if [ ! -L $target ]; then
        echo "backing up .$name in $HOME/$backup/ directory"
        if [ ! -d "$HOME/$backup" ]; then
          mkdir -p "$HOME/$backup"
        fi
        cp "$target" "$HOME/$backup/.$name"
        rm -rf "$target"
      else
        rm -rf "$target"
      fi
    fi

    echo "Linking .$name"
    ln -fs "$PWD/$name" "$target"
  fi
done
