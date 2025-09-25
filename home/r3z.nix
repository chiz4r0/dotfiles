{ config, pkgs, ... }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/dconf.nix
    ./modules/git.nix
    ./modules/package.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  home.username = "r3z";
  home.homeDirectory = "/home/r3z";

  programs.zsh.enable = true;


  home.stateVersion = "25.05";
}

