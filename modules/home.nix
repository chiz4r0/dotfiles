{ config, pkgs, ... }:

{
  imports = [
    ./home/alacritty
    ./home/direnv
    ./home/git
    ./home/hyprland
    ./home/nvim
    ./home/zsh
  ];

  home.packages = with pkgs; [
    android-studio
    nautilus
    vscode
  ];

}
