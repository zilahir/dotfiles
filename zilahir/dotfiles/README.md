# dotfiles

My personal dotfiles managed with [Home Manager](https://nix-community.github.io/home-manager/) and Nix.

## Machines

- **MacBook Air** (`macair.nix`)
- **Raspberry Pi** (`rpi.nix`)

## Install

### Manual install (bare git repo)

```bash
git clone --bare https://github.com/zilahir/dotfiles.git $HOME/zilahir/dotfiles
dotfiles() { git --git-dir="$HOME/zilahir/dotfiles" --work-tree="$HOME" "$@"; }
dotfiles checkout
```

### Install script

```bash
curl -fsSL https://raw.githubusercontent.com/zilahir/dotfiles/master/install.sh | sh -
```

## Structure

```
.config/nixpkgs/home-manager/
├── common.nix      # Shared configuration
├── macair.nix      # MacBook Air specific
└── rpi.nix         # Raspberry Pi specific
```

## Apply configuration

```bash
# On Raspberry Pi
home-manager switch --file ~/.config/nixpkgs/home-manager/rpi.nix

# On Mac
home-manager switch --file ~/.config/nixpkgs/home-manager/macair.nix
```

## Packages

### Common (all machines)

- **Neovim** - Editor
- **Lazygit** - Git UI
- **Zsh** - Shell with oh-my-zsh
- **Oh-my-posh** - Prompt theme (Catppuccin Mocha)
- **Eza** - Modern `ls`
- **Zoxide** - Smart `cd`
- **Atuin** - Shell history
- **Fzf** - Fuzzy finder
- **Ripgrep** - Fast search
- **Fd** - Fast `find`
- **Tmux** - Terminal multiplexer (disabled, using Zellij)
- **Zellij** - Modern terminal multiplexer
- **Tree** - Directory tree viewer
- **Go** - Go language
- **Cargo** - Rust package manager
- **pnpm** - Node.js package manager
- **Air** - Live reload for Go
- **Templ** - Go HTML templating
- **go-migrate** - Database migrations
- **Speedtest-cli** - Internet speed test
- **jq** - JSON processor
- **lynx** - Text browser
- **miniserve** - File server

### Raspberry Pi specific

- **Volta** - Node.js version manager
- **WireGuard-tools** - VPN client

**Note:** For WireGuard VPN to work properly, install `resolvconf` manually on the Pi:

```bash
sudo apt install resolvconf
```

### Mac specific

- **Volta** - Node.js version manager
- **libpqxx** - PostgreSQL C++ client
- **PHP** - PHP with Composer
- **iamb** - Matrix client

## Shell aliases

```bash
dotfiles   # Git for dotfiles
gs         # git status
gpr        # git pull --rebase
lazygit    # gitui (aliased)
```

