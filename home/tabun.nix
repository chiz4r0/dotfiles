{ config, pkgs, ... }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/dconf.nix
    ./modules/git.nix
    ./modules/package.nix
    ./modules/zsh.nix
  ];

  home.username = "tabun";
  home.homeDirectory = "/home/tabun";

  programs.zsh.enable = true;


  home.stateVersion = "25.05";
}

