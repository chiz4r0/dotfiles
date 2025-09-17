{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    alacritty
    libreoffice
    mediawriter
    remmina
    telegram-desktop
    vscode
  ];
}
