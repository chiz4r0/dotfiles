{ config, pkgs, ... }:

{
  imports = [
    ./home/alacritty
    ./home/direnv
    ./home/git
    ./home/hyprland
    ./home/nvim
    ./home/tmux
    ./home/zsh
  ];

  home.packages = with pkgs; [
    android-studio
    libreoffice-fresh
    mpv
    obsidian
    nautilus
    vscode
    zotero
  ];

}
