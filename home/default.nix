{ config, pkgs, ... }:

{
  imports = [
    ./modules/alacritty
    ./modules/direnv
    ./modules/git
    ./modules/hyprland
    ./modules/kitty
    ./modules/nvim
    ./modules/tmux
    ./modules/zsh
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
