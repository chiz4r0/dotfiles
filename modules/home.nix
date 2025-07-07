{ config, pkgs, ... }:

{
  imports = [
    ./home/git
    ./home/hyprland
    ./home/nvim
  ];

  home.packages = with pkgs; [
    vscode
  ];
}