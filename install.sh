#!/bin/bash

backup_dir=".dotfiles.backup"

for name in *; do
  target="$HOME/.$name"

  if [[ $name != 'install.sh' && $name != 'gitconfig' ]]; then

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

function generate_gitconfig() {
  read -p "Name: " name
  read -p "Email: " email
  read -p "Github Username: " gh_username
  cat gitconfig | sed 's/${name}/'"$name"'/' | sed 's/${email}/'"$email"'/' | sed 's/${gh_username}/'"$gh_username"'/' > "$HOME/.gitconfig"
}

function backup_gitconfig() {
  if [ ! -d "$HOME/$backup_dir" ]; then
    mkdir -p "$HOME/$backup_dir"
  fi
  cp "$HOME/.gitconfig" "$HOME/$backup_dir/.gitconfig";
}

echo "Creating .gitconfig"
if [ -e "$HOME/.gitconfig" ]; then
  read -p "Reset .gitconfig? [y=Yes; n=No; b=Backup]" yn
  case $yn in
      [Yy]* ) rm -rf "$HOME/.gitconfig";generate_gitconfig;;
      [Nn]* ) echo ".gitconfig ignored";;
      [Bb]* ) backup_gitconfig; rm -rf "$HOME/.gitconfig";generate_gitconfig;;
      * ) echo ".gitconfig ignored";;
  esac
else
  generate_gitconfig
fi
