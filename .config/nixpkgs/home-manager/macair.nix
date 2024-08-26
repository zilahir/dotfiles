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
      neovim
      atuin
      ripgrep
      eza
      zoxide
      tree
      gitui
      fd
      zsh
      zsh-syntax-highlighting
      tmux
      antidote
      zsh-powerlevel10k
      speedtest-cli
      jq
      git
      fzf
    ];

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

    initExtraBeforeCompInit = builtins.readFile ../../zsh/.zshinit;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    shellAliases = {
    #   ls = builtins.readFile ../../../bin/ls;
      dotfiles = "git --git-dir=$HOME/zilahir/dotfiles --work-tree=$HOME";
    };
  };

  #p10k config
  home.file.".p10k.zsh".text = builtins.readFile ../../zsh/.p10k.zsh;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
