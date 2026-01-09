#!/bin/bash
set -e

BARE_REPO="$HOME/zilahir/dotfiles"
REPO_URL="https://github.com/zilahir/dotfiles.git"

# Exit if repo exists (don't delete!)
if [ -d "$BARE_REPO" ]; then
    echo "Dotfiles already exist at $BARE_REPO"
    echo "Run 'dotfiles status' to check"
    exit 0
fi

# Clone bare repo
echo "Cloning bare repo to $BARE_REPO..."
git clone --bare "$REPO_URL" "$BARE_REPO"

# Define dotfiles as function for this script
dotfiles() { git --git-dir="$BARE_REPO" --work-tree="$HOME" "$@"; }

# Backup conflicting files, then checkout
echo "Checking out dotfiles..."
mkdir -p "$HOME/.dotfiles-backup"
dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | \
    xargs -I {} mv "$HOME/{}" "$HOME/.dotfiles-backup/" 2>/dev/null || true
dotfiles checkout

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no

echo ""
echo "Dotfiles installed successfully!"
echo " - Use 'dotfiles status' to see status"
echo " - Use 'dotfiles add <file>' to add files"
echo " - Use 'dotfiles commit -m \"msg\"' to commit"
echo ""
echo "Run 'home-manager switch' to apply Home Manager configuration"
