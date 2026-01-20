{ config, lib, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  # Machine-specific settings
  home.username = "zilahir";
  home.homeDirectory = "/home/zilahir";
  home.stateVersion = "25.11";

  programs.home-manager.path = "/home/pi/.config/nixpkgs/home-manager";

  # Git email (override the common.nix setting if different)
  programs.git.extraConfig.user.email = "zilahi@gmail.com";

  # Raspberry Pi specific packages (if any)
  home.packages = with pkgs; [
    # Add RPi-specific packages here
  ];

  # Override or add RPi-specific shell aliases
  programs.zsh.shellAliases = {
    # Mac-specific aliases removed (kittyu, ff)
    # Add any RPi-specific aliases here
  };
}
