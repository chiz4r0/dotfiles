{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    alacritty
    libreoffice
    mediawriter
    telegram-desktop
    vscode
  ];
}
