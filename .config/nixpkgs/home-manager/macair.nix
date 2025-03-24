{ config, lib, pkgs, ... }:

# let
#   dotfiles = buitins.fetchgit {
#       url = ""
#       ref = "master";
#     };
# in

{
    home.username = "richardzilahi";
    home.homeDirectory = "/Users/richardzilahi";
    home.stateVersion = "24.11";

    programs.home-manager.path = "/Users/richardzilahi/.config/nixpkgs/home-manager";
    programs.home-manager.enable = true;

    #config
    programs.git = {
      enable = true;
      userName = "Richard Zilahi";
    };

    #packages
    home.packages = with pkgs; [
      libpqxx
      air
      templ
      atuin
      ripgrep
      eza
      zoxide
      tree
      lazygit
      fd
      zsh
      zsh-syntax-highlighting
      antidote
      speedtest-cli
      jq
      git
      fzf
      tailwindcss
      lynx
      miniserve
      php83Packages.composer
      php
      go-migrate
      iamb
      go
      cargo
    ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    # useTheme = "catppuccin_mocha";
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ../../zsh/oh-my-posh/mocha.json));
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    extraConfig = builtins.readFile ../../tmux/tmux.conf.bak;
  };

  programs.dircolors = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [];
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--icons"
      "--all"
      "--long"
    ];
  };


  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };
    sessionVariables = {
      GITODO_VS_CODE_EXAMPLE_WORKSPACE_PATH="$HOME/zilahir/todo-demo/"; # Change this to your desired path

    };
    autosuggestion.enable = true;
    enableCompletion = true;
    antidote.enable = false;
    antidote.plugins = [
      "zsh-users/zsh-autosuggestions"
      "zsh-users/zsh-syntax-highlighting"
      "zsh-users/zsh-history-substring-search"
      "rupa/z"
      "ohmyzsh/ohmyzsh path:lib"
      "ohmyzsh/ohmyzsh path:plugins/extract"
    ];

    initExtra = builtins.readFile ../../zsh/.zshinit;
    syntaxHighlighting.enable = true;

    plugins = [
      # {
      #   name = "powerlevel10k";
      #   src = pkgs.zsh-powerlevel10k;
      #   file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # }
    ];

    shellAliases = {
      dotfiles = "git --git-dir=$HOME/zilahir/dotfiles --work-tree=$HOME";
      kittyu = "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin";
      lu = ". ~/bin/dotfiles_lazylock";
      tailwind = "tailwindcss";
      gb = "git rev-parse --abbrev-ref HEAD | pbcopy";
      gitui = "lazygit";
      gs = "git status";
      gpr = "git pull --rebase";
      ff = ". ~/bin/aerospace";
    };
  };

  #p10k config
  # home.file.".p10k.zsh".text = builtins.readFile ../../zsh/.p10k.zsh;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.go = {
    enable = true;
    goPath = "${config.home.homeDirectory}/go";
  };
}
