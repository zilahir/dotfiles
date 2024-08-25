# check if ~/tmpdotfiles exists

if [ -d ~/tmpdotfiles ]; then
  echo "Directory ~/tmpdotfiles exists."
else
  mkdir -p ~/tmpdotfiles
fi

git clone --separate-git-dir=$HOME/zilahir/dotfiles https://github.com/zilahir/dotfiles.git ~/tmpdotfiles
rsync --recursive --verbose --exclude '.git' ~/tmpdotfiles/ $HOME/
rm -r ~/tmpdotfiles
