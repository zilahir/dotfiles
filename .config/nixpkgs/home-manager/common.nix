{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  # Git configuration (email can be overridden in machine-specific files)
  programs.git = {
    enable = true;
    extraConfig = {
      user.name = "Richard Zilahi";
    };
  };

  # Common packages
  home.packages = with pkgs; [
    ripgrep
    tree
    lazygit
    fd
    speedtest-cli
    jq
    lynx
    miniserve
    go
    cargo
    pnpm
    air
    templ
    go-migrate
    wgnord  # NordVPN WireGuard client
  ];

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Claude Code
  programs.claude-code = {
    enable = true;
  };

  # Oh-my-posh
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ../../zsh/oh-my-posh/mocha.json));
  };

  # Tmux (disabled in favor of zellij, but config preserved)
  programs.tmux = {
    enable = false;
    clock24 = true;
    mouse = true;
    extraConfig = builtins.readFile ../../tmux/tmux.conf.bak;
  };

  # Zellij
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  # Dircolors
  programs.dircolors = {
    enable = true;
  };

  # Zoxide
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Atuin
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  # Eza
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--icons"
      "--all"
      "--long"
    ];
  };

  # Zsh
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };
    autosuggestion.enable = true;
    enableCompletion = true;

    initContent = builtins.readFile ../../zsh/.zshinit + ''
      # Volta (Node.js version manager)
      export VOLTA_HOME="$HOME/.volta"
      export PATH="$VOLTA_HOME/bin:$PATH"

      # wgnord VPN helper (needs sudo with preserved PATH)
      _wgnord_bin="${HOME}/.nix-profile/bin/wgnord"
      wgnord() { sudo env "PATH=$PATH" "$_wgnord_bin" "$@"; }

      # Auto-rename zellij tabs to current directory
      if [[ -n $ZELLIJ ]]; then
        function zellij_tab_name_update() {
          if [[ -n $ZELLIJ ]]; then
            tab_name=$(basename "$PWD")
            command nohup zellij action rename-tab "$tab_name" >/dev/null 2>&1
          fi
        }
        precmd_functions+=(zellij_tab_name_update)
        zellij_tab_name_update
      fi
    '';
    syntaxHighlighting.enable = true;

    shellAliases = {
      dotfiles = "git --git-dir=$HOME/zilahir/dotfiles --work-tree=$HOME";
      lu = ". ~/bin/dotfiles_lazylock";
      tailwind = "tailwindcss";
      gb = "git rev-parse --abbrev-ref HEAD | pbcopy";
      gitui = "lazygit";
      gs = "git status";
      gpr = "git pull --rebase";
    };
  };

  # Fzf
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Go
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/go";
    };
  };
}
