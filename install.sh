git clone --separate-git-dir=$HOME/zilahir/dotfiles https://github.com/zilahir/dotfiles.git ~/tmpdotfiles
rsync --recursive --verbose --exclude '.git' ~/tmpdotfiles/ $HOME/
rm -r ~/tmpdotfiles
