{ config, lib, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  # Machine-specific settings
  home.username = "pi";  # Change this to your Raspberry Pi username
  home.homeDirectory = "/home/pi";  # Change this to match your username
  home.stateVersion = "24.11";

  programs.home-manager.path = "/home/pi/.config/nixpkgs/home-manager";  # Adjust path as needed

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
