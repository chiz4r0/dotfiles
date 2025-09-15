{ config, pkgs, ... }:

{
  imports = [
    ./modules/dconf.nix
    ./modules/git.nix
    ./modules/package.nix
  ];

  home.username = "tabun";
  home.homeDirectory = "/home/tabun";

  programs.zsh.enable = true;


  home.stateVersion = "25.05";
}

