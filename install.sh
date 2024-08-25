/bin/bash

# check if the target folder if exists, and its not empty

if [ -d ~/zilahir/dotfiles ] && [ -n "$(ls -A ~/zilahir/dotfiles)" ]; then
  echo "Directory ~/zilahir/dotfiles exists and is not empty, deleting"
  rm -rf ~/zilahir/dotfiles
  mkdir -p ~/zilahir/dotfiles
fi

# check if ~/tmpdotfiles exists
if [ -d ~/tmpdotfiles ]; then
  echo "Directory ~/tmpdotfiles exists."
else
  mkdir -p ~/tmpdotfiles
fi

git clone --separate-git-dir=$HOME/zilahir/dotfiles https://github.com/zilahir/dotfiles.git ~/tmpdotfiles
rsync --recursive --verbose --exclude '.git' ~/tmpdotfiles/ $HOME/
rm -r ~/tmpdotfiles
