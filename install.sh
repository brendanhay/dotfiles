#!/bin/bash

backup_dir="dotfiles.backup"

for name in *; do
  target="$HOME/.$name"

  if [[ $name != 'install.sh' ]]; then

    if [ -e $target ]; then
      if [ ! -L $target ]; then
        echo "backing up .$name in $HOME/$backup_dir/ directory"
        if [ ! -d "$HOME/$backup_dir" ]; then
          mkdir -p "$HOME/$backup_dir"
        fi
        cp "$target" "$HOME/$backup_dir/.$name"
        rm -rf "$target"
      else
        rm -rf "$target"
      fi
    fi

    echo "Creating .$name"
    ln -s "$PWD/$name" "$target"
  fi
done
