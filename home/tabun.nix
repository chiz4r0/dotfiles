{ config, pkgs, ... }:

{
  home.username = "tabun";
  home.homeDirectory = "/home/tabun";

  programs.zsh.enable = true;
  programs.git.enable = true;

  home.stateVersion = "25.05";
}

