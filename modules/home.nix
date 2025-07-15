{ config, pkgs, ... }:

{
  imports = [
    ./home/alacritty
    ./home/direnv
    ./home/git
    ./home/hyprland
    ./home/kitty
    ./home/nvim
    ./home/tmux
    ./home/zsh
  ];

  home.packages = with pkgs; [
    android-studio
    pop-gtk-theme
    gvfs
    libreoffice-fresh
    mpv
    obsidian
    remmina
    vscode
    yazi
    zotero
  ];

}
